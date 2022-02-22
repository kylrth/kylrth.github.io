---
title: "Deep learning scaling is predictable, empirically"
link: "https://arxiv.org/abs/1712.00409"
date: 2022-02-14T10:38:11-05:00
draft: false
tags: ["deep-learning", "neural-scaling"]
---

*This was a paper we presented about in Irina Rish's neural scaling laws course ([IFT6167](https://sites.google.com/view/nsl-course)) in winter 2022. You can view the slides we used [here](https://docs.google.com/presentation/d/1e0SXonZiW6o8VyqXTnjyYlMs97YCcntBznaoiBwlWFE/edit?usp=sharing).*

It's important to note that in the results for NMT (Figure 1) we would expect the lines in the graph on the left to curve as the capacity of the individual models is exhausted. That's why the authors fit the curves with an extra constant added. Meanwhile, the results in the graph on the right are curved because as the data size grows, the optimal model size also grows and it becomes increasingly difficult to find the right hyperparameters to train the model down to the optimal generalization error. (See the last paragraph in Section 4.1.)
