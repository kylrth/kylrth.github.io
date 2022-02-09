---
title: "Parallel training of deep networks with local updates"
link: "https://arxiv.org/abs/2012.03837"
date: 2022-02-09T10:50:21-05:00
draft: false
tags: ["deep-learning", "optimization"]
---

*This post was created as an assignment in Irina Rish's neural scaling laws course ([IFT6167](https://sites.google.com/view/nsl-course)) in winter 2022. The post contains no summarization, only questions and thoughts.*

Once I learned how the loss functions worked for each chunk, my first question was whether the earlier chunks were going to be able to learn the low-level features that later chunks would need. Figure 7 seems to show that they do, although their quality apparently decreases with increasingly local updates.

My initial take after reading this is that maybe the best method is to start training with local updates and then use standard backprop to eek out the last bit of performance. It wouldn't be hard to predict the target loss using a power law estimation.
