---
title: "Learning transferable visual models from natural language supervision (CLIP)"
link: "https://arxiv.org/abs/2103.00020"
date: 2022-02-02T12:35:03-05:00
draft: false
tags: ["deep-learning", "neural-scaling", "nlp"]
---

*This post was created as an assignment in Irina Rish's neural scaling laws course ([IFT6167](https://sites.google.com/view/nsl-course)) in winter 2022. The post contains no summarization, only questions and thoughts.*

This concept of wide vs. narrow supervision (rather than binary "supervised" and "unsupervised") is an interesting and flexible way to think about the way these training schemes leverage data.

The zero-shot CLIP matches the performance of 4-shot CLIP, which is a surprising result. What do the authors mean when they make this guess about zero-shot's advantage:

> CLIP’s zero-shot classifier is generated via natural language which allows for visual concepts to be directly specified ("communicated"). By contrast, "normal" supervised learning must infer concepts indirectly from training examples.

Are they saying that the context provided by the other parts of the prompt is what helps the model select the concept we're asking for? Why can't both zero- and few-shot methods take advantage of the prompt? I think I need a better understanding of the differences between zero-shot and few-shot inference here.

The concept of *robustness* (the difference in accuracy on naturally-shifted datasets compared to original datasets) discussed in this paper seems particularly useful. I wonder if any experiments have measured the robustness of humans on similar distribution shifts.

The section about the limitations of CLIP observes that "zero-shot CLIP still generalizes poorly to data that is truly out-of-distribution for it". My question is, are humans able to generalize well to data that is *truly* out-of-distribution for *them*? When a human who's unfamiliar with AI research looks at a sample from MNIST, does that qualify as out-of-distribution?
