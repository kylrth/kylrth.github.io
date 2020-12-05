---
title: "SpanBERT: improving pre-training by representing and predicting spans"
link: "https://arxiv.org/abs/1907.10529"
date: 2020-12-05T16:08:03-07:00
draft: false
tags: ["nlp", "optimization"]
---

[BERT]({{< relref "bert.md" >}}) optimizes the Masked Language Model (MLM) objective by masking word pieces *uniformly at random* in its training data and attempting to predict the masked values. With SpanBERT, spans of tokens are masked and the model is expected to predict the text in the spans from the representations of the words on the boundary. Span lengths follow a geometric distribution, and span start points are uniformly random.

To predict each individual masked token, a two-layer feedforward network was provided with the boundary token representations plus the position embedding of the target token, and the output vector representation was used to predict the masked token and compute cross-entropy loss exactly as in standard MLM.

I was surprised to learn that linguistically-informed masking resulted in slightly *worse* results. I'd like to try to understand that a bit better, because that is the opposite of what I'd expect.
