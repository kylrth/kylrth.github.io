---
title: "Masked autoencoders are scalable vision learners"
link: "https://arxiv.org/abs/2111.06377"
date: 2022-02-11T14:18:30-05:00
draft: false
tags: ["deep-learning", "vision"]
---

*This post was created as an assignment in Irina Rish's neural scaling laws course ([IFT6167](https://sites.google.com/view/nsl-course)) in winter 2022. The post contains no summarization, only questions and thoughts.*

In this paper they mention that the mask vector is learned, and it sounds like the positional embeddings are also learned. I remember in [*Attention is all you need*]({{< relref "attention-all-you-need/index.md" >}}) they found that cosine positional embeddings worked better than learned ones, especially for sequences of longer length. But now it seems like most papers are doing learned embeddings. If anyone knows why, send me an email.

It's interesting that the optimal masking ratio is around 75%. Like the authors suggest, I think that probably reflects the sparseness of the information in images. I wonder if using a different loss function might help the model generalize better at the object level instead of the pixel level.
