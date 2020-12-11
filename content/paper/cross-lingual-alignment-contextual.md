---
title: "Cross-lingual alignment of contextual word embeddings, with applications to zero-shot dependency parsing"
link: "https://arxiv.org/abs/1902.09492"
date: 2020-12-11T06:30:43-07:00
draft: true
tags: ["nlp", "embedding"]
mathjax: true
---

Recent contextual word embeddings (e.g. [ELMo]({{< relref "deep-contextualized-word-representations.md" >}})) have shown to be much better than "static" embeddings (where there's a one-to-one mapping from token to representation). This paper is exciting because they were able to create a multi-lingual embedding space that used *contextual* word embeddings.

Each token will have a "point cloud" of embedding values, one point for each context containing the token. They define the *embedding anchor* as the average of all those points for a particular token. Here's a figure from the paper that displays a two-dimensional PCA of the contextual representations for four Spanish words, along with their anchors:

{{< zoom-img src="pca.png" >}}

The authors then list some key properties of this learned contextualized embedding:

- The point clouds are well separated, meaning that contextualized points tend to be much closer to their anchors than anchors are to each other.
- Distinct senses for the same word are separated into distinct clouds, and those clouds are aligned with their corresponding distinct senses or words in the target language.

## context-independent alignment

Whether a dictionary is available or not, the authors assume a linear transformation exists between languages; that is, for an embedding `\(e_i^s\)` of token `\(i\)` in language `\(s\)`, the embedding `\(e_i^t\)` in language `\(t\)` is approximated by `\(We_i^s\)`, where `\(W\)` is learned. The learned transition matrix `\(W^{s\rightarrow t}\)` can be found by solving the following optimization problem:

<div>\[W^{s\rightarrow t}=\underset{W\in O_d(\mathbb R)}{\operatorname{argmin}}\sum_{i=1}^n\left|\left|We_i^s-e_i^t\right|\right|^2\]</div>

where `\(O_d(\mathbb R)\)` is the space of orthogonal matrices. This makes the solution `\(W^{s\rightarrow t}=UV^\top\)` where `\(U\)` and `\(V\)` are the `\(U\)` and `\(V\)` from the SVD of the multiplication of the source and (transposed) target embedding matrices. This can be calculated directly if there is a dictionary, but if there is none adversarial training can generate a dictionary to trick a discriminator trained to distinguish between embeddings from the target and embeddings from aligned source.

## context-dependent alignment

In the supervised case (with a dictionary), you can just use the anchors discussed above as the `\(e_i\)` values. And since `\(W^{s\rightarrow t}\)` is constrained to be orthogonal, relationships between contextual embeddings are preserved across transformations into the target language.

In the unsupervised case they used multiple embeddings induced by different contexts, but the training was less stable than the anchor version.

## a shared pretrained embedding

In the previous discussion the authors started from separate pretrained embeddings for each language, but in the case of a low-resource language it could be useful to learn a shared embedding for both languages that allows the low-resource language to benefit from the structure of the higher-resource language.

> Our key idea is to constrain the embeddings across languages such that word translations will be close to each other in the embedding space.

They implement this as an actual regularization term for the loss function (with `\(v_i^s\)` being the word representation prior to the context-aware part):

<div>\[\lambda_{\text{anchor}}\cdot\sum_i\left|\left|v_i^s-v_{D(i)}^t\right|\right|_2^2\]</div>
