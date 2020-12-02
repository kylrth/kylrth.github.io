---
title: "A disciplined approach to neural network hyperparameters: part 1"
link: "https://arxiv.org/abs/1803.09820v2"
date: 2020-08-28T14:16:29-06:00
draft: false
tags: ["optimization"]
---

The goal of hyperparameter tuning is to reach the point where test loss is horizontal on the graph over model complexity.

Underfitting can be observed with a small learning rate, simple architecture, or complex data distribution. You can observe underfitting decrease by seeing more drastic results at the outset, followed by a more horizontal line further into training. You can use the LR range test to find a good learning rate range, and then use a cyclical learning rate to move up and down within that range.

The *LR range test* is a run of training that starts at a small learning rate and then slowly increases until the rate is too high and the validation loss increases. [This article](https://www.deepspeed.ai/tutorials/lrrt/) talks a little about what performing the LR range test looks like in practice. (They don't go into great technical detail unfortunately.) [This PyTorch implementation of LRRT](https://github.com/davidtvs/pytorch-lr-finder) looks good.

*Regularization* should be balanced with the dataset and architecture. It's silly to have a small learning rate with lots of regularization, when you could have a large learning rate and less regularization (accomplishing the same regularizing effect with faster convergence). The solution is to perform the LR range test under a variety of regularization conditions in order to find an optimal balance.

In their study of *batch size*, they took into account the total execution time for training. Modelers are interested in reaching optimal test performance in the minimum amount of wall time. A larger batch size allows for higher learning rate (#regularization) and thus faster convergence, but the benefit tapers off, probably because of the reduction in number of iterations.

*Momentum* and learning rate are interconnected; changing one changes the optimal value for the other. It turns out that using cyclical momentum that decreases as LR increases reaches similar results to a best constant momentum, but allows for larger learning rates.

For *weight decay*, the best value should remain constant through training. Validation loss early in training is sufficient for determining a good value. Smaller datasets and architectures seem to require larger values for weight decay.

**There's a nice recipe in section 5 for putting all of this together.**

## papers that cite this one

The [fast.ai paper](https://www.mdpi.com/2078-2489/11/2/108) uses a variant of the 1cycle learning policy with warm-up and annealing on both the learning rate and momentum.
