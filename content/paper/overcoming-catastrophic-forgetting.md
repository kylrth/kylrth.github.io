---
title: "Overcoming catastrophic forgetting in neural networks"
link: "https://arxiv.org/abs/1612.00796"
date: 2020-10-01T10:47:28-06:00
draft: false
tags: ["optimization", "generalization"]
mathjax: true
---

In the paper they use Bayes' rule to show that the contribution of the first of two tasks is contained in the posterior distribution of model parameters over the first dataset. This is important because it means we can estimate that posterior to try to get a sense for which model parameters were most important for that first task.

In this paper, they perform that estimation using a multivariate Gaussian distribution. The means are the values of the model parameters after training on the first dataset, and the precision (inverse of variance) is the values of the diagonals along the Fisher information matrix.

They created a new regularization method called *elastic weight consolidation* (EWC). Here it is:

- train on the first dataset as normal
- compute the Fisher information matrix
- when training on a second dataset `\(B\)`, use the following updated loss function. `\(\lambda\)` is a hyperparameter, `\(F_i\)` is the `\(i\)`th element on the diagonal of the information matrix, and `\(\theta_{A,i}^*\)` is the `\(i\)`th model parameter after training on dataset `\(A\)`.

    <div>\[L(\theta)=L_B(\theta) + \sum_i\frac\lambda 2 F_i\left(\theta_i-\theta_{A,i}^*\right)^2\]</div>

## why the Fisher information matrix

*This section borrows heavily from the Wikipedia article on [Fisher information](https://en.wikipedia.org/wiki/Fisher_information).*

The *score* of the likelihood function `\(f(X;\theta)\)` of a random variable `\(X\)` with respect to a (possibly unknown) parameter `\(\theta\)` is

<div>\[\frac\partial{\partial\theta}\log f(X;\theta).\]</div>

The score has the property that its expected value is zero when `\(\theta\)` is at its true value. Intuitively, this means that the score is most certain (has least variance) when this hidden parameter `\(\theta\)` is at its true value. Thus the variance of the score is a measure of how much information samples from random variable `\(X\)` give us about the parameter `\(\theta\)`. The variance of the score is *Fisher information*.

The *Fisher information matrix* is useful in the case where `\(\theta\)` is actually a vector of parameters, as in our neural network. The matrix is like a covariance matrix of the score:

<div>\[\left[\mathcal I(\theta)\right]_{i,j}=\mathbb E\left[\left(\frac\partial{\partial\theta_i}\log f(X;\theta)\right)\left(\frac\partial{\partial\theta_j}\log f(X;\theta)\right)\right|\left.\vphantom{\frac\partial{\partial\theta_j}}\theta\right]\]</div>

It's not so important to understand the matrix to understand EWC, because only the *trace* of the matrix is used in the algorithm. The trace contains the regular Fisher information of the random variable with respect to each of the parameters of the neural network. `\(f(X;\theta)\)` is approximated by the model predictions over the first dataset.
