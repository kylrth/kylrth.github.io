---
title: "Understanding deep learning requires rethinking generalization"
link: "https://arxiv.org/abs/1611.03530"
date: 2020-08-26T08:42:58-06:00
draft: false
categories: ["deep-learning", "generalization"]
mathjax: true
---

It turns out that neural networks can reach training loss of 0 even on randomly labeled data, even when the data itself is random. It was previously thought that some implicit bias in the model architecture prevented (or *regularized the model away from*) overfitting to specific training examples, but that's obviously not true. They showed this empirically as just described, and also theoretically constructed a two-layer ReLU network with `\(p=2n+d\)` parameters to express *any labeling* of any sample of size `\(n\)` in `\(d\)` dimensions. The proof was actually relatively easy to follow.

Regularization (dropout, weight decay, data augmentation, early stopping, batch norm) plays a somewhat important role in improving generalization, but not as much as switching architectures. It's obvious that regularization is **not** the fundamental reason for generalization.

The authors next took a look at the simpler case of a linear model, and derived the point to which SGD will converge. It turns out that fitting the training data exactly works great for this linear model. It achieved good accuracy on MNIST and CIFAR10. One interesting point they make is that the solution arrived at with SGD is often the **minimum L2 norm** solution.

In the conclusion they add that they've shown that "optimization continues to be empirically easy even if the resulting model does not generalize". Thus ease of optimization is not correlated with generalization.
