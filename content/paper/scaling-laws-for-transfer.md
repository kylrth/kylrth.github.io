---
title: "Scaling laws for transfer"
link: "https://arxiv.org/abs/2102.01293"
date: 2022-02-16T14:12:26-05:00
draft: false
tags: ["deep-learning", "neural-scaling"]
---

*This post was created as an assignment in Irina Rish's neural scaling laws course ([IFT6167](https://sites.google.com/view/nsl-course)) in winter 2022. The post contains no summarization, only questions and thoughts.*

Sometimes these scaling laws can feel like pseudoscience because they're a post hoc attempt to place a trend line on data. How can we be confident that the trends we observe actually reflect the scaling laws that we're after? In the limitations section they mention that they didn't tune hyperparameters for fine-tuning or for the code data distribution. How can we know that a confounding hyperparameter is not responsible for the trend we see? I wonder if we aren't really being statistically rigorous until we can predict generalization error on an unseen *training setup*, rather than just an unseen model size/dataset size.
