---
title: "Neural message passing for quantum chemistry"
link: "https://arxiv.org/abs/1704.01212"
date: 2022-03-25T14:46:11-04:00
draft: false
tags: ["deep-learning", "simulation"]
mathjax: true
---

*This post was created as an assignment in Bang Liu's [IFT6289](https://www-labs.iro.umontreal.ca/~liubang/IFT%206289%20-%20Winter%202022.htm) course in winter 2022. The structure of the post follows the structure of the assignment: summarization followed by my own comments.*

To summarize, the authors create a unifying framework for describing message-passing neural networks, which they apply to the problem of predicting the structural properties of chemical compounds in the QM9 dataset.

## paper summarization

The authors first demonstrate that many of the recent works applying neural nets to this problem can fit into a message-passing neural network (MPNN) framework. Under the MPNN framework, at each time step `\(t\)` a message is computed for each vertex by summing the output of a learned function `\(M_t\)` over the vertex and all edges and vertices connected to it. Then the next state for each vertex is a learned function `\(U_t\)` of the previous state and the message. Finally, the "readout" function `\(R\)` is applied to all the vertices to compute the result.

It's important to note that the readout function `\(R\)` is expected to be invariant to the order of its inputs, meaning that it will be invariant to [geometric isomerism](https://en.wikipedia.org/wiki/Cis%E2%80%93trans_isomerism).

The authors acknowledge that the results they're approximating are themselves approximations, produced using a density functional theory (DFT) simulation, but they feel that "it is hard to believe success on more challenging chemical tasks will be possible if we can't make accurate statistical predictions for the properties computed in QM9" (section 4).

The authors start from the gated graph neural network (GG-NN) model as a baseline. For GG-NNs, the MPNN functions are the following:

<div>\[M_t=A_{e_{vw}}h_w^t\]</div>
<div>\[U_t=\text{GRU}(h_v^t,m_v^{t+1})\]</div>
<div>\[R=\sum_{v\in V}\sigma\left(i(h_v^{(T)},h_v^0)\right)\cdot\left(j(h_v^{(T)})\right)\]</div>

Where `\(A_{e_{vw}}\)` is a learned matrix for edge `\(e_{vw}\)`, and `\(i,j\)` are neural networks.

The authors attempt the following modifications to the GG-NN architecture. I'll mark each one that ended up in the best-performing model:

- message functions
  - replace `\(A_{e_{vw}}\)` with `\(A(e_{vw})\)`, a neural network that creates a `\(d\times d\)` matrix from the edge vector `\(e_{vw}\)` (**best performance**)
  - allow the message from node `\(w\)` to node `\(v\)` to depend on `\(h_v\)` in addition to `\(h_w\)` and `\(e_{vw}\)`
  - *multiple towers*: propagate messages on subsets of the hidden states independently and then recombine with a neural mixing function
- "virtual" graph elements
  - virtual edges between all nodes (**best performance**)
  - latent master node connected to all nodes
- readout function
  - [set2set](https://arxiv.org/abs/1511.06391) (**best performance**)
- input representation
  - represent hydrogen atoms as nodes instead of just including count as a feature of other nodes (**best performance**)
  - edge inputs:
    - discrete bond types (single, double, triple, aromatic)
    - distance bins (discrete; highly correlated with bond type)
    - raw distance feature in addition to bond type (continuous; when message function allows; **best performance**)

The resulting model outperformed all previous work by a large margin. The results were much stronger for models trained to predict one of the 13 desired metrics, rather than all 13 at once. On 11 of the 13 tasks, the results were better than [*chemical accuracy*](https://chemistry.stackexchange.com/questions/62001/why-is-chemical-accuracy-defined-as-1-kcal-mol), which is the target error expected by the chemistry research community.

## comments

From the second paragraph in section 8:

> We also found that training one model per target consistently outperformed jointly training on all 13 targets. In some cases the improvement was up to 40%.

To me this sounds like an information bottleneck due to capacity. I imagine scaling up the model size would solve this problem. They theorized that the "multiple towers" method worked a bit like ensembling; maybe scaling that model large enough would solve the information bottleneck without unreasonable computational complexity.
