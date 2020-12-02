---
title: "Forward and reverse gradient-based hyperparameter optimization"
link: "https://arxiv.org/abs/1703.01785"
date: 2020-08-28T14:16:29-06:00
draft: false
tags: ["optimization"]
---

In the area of hyperparameter optimization (HO), the goal is to optimize a *response function* of the hyperparameters. The response function is usually the average loss on a validation set. Gradient-based HO refers to iteratively finding the optimal hyperparameters using gradient updates, just as we do with neural network training itself. The gradient of the response function with respect to the hyperparameters is called the *hypergradient*.

One of the great things about this work is that their framework allows for all kinds of hyperparameters. The response function can be based on evaluation over the training set, the validation set, or both. The hyperparameters can be part of the loss function, part of regularization, or part of the model architecture.

## forward and reverse modes

Just as in regular automatic differentiation, there's a forward mode and reverse mode, and these have similar benefits and drawbacks to their AD counterparts. In reverse mode, we have to store the entire optimization path taken as the model is trained, in order to differentiate with respect to the hyperparameters. In forward mode, we have to perform the iterative training separately for each hyperparameter. ([Here](https://rufflewind.com/2016-12-30/reverse-mode-automatic-differentiation)'s a guide to forward/reverse-mode AD if you need it.)

Perhaps a better comparison to make is with the two available ways to train RNNs. One is *back-propagation through time*, where parameters end up being updated multiple times after the entire sequence is produced. The other is *real-time recurrent learning* (RTRL), where parameters are updated after each time step. The authors argue that using a similar approach to hyperparameter updates could "significantly speed up the overall hyperparameter optimization procedure in the presence of large datasets." They even say they're going to show that constrained HO can be used to detect noisy samples and discover relationships between different learning tasks. [Can I get a yeet in the group chat?]

## experiments

### data hyper-cleaning

They started by corrupting the labels of some of the training examples in MNIST. Then they gave each training example a learnable hyperparameter between 0 and 1 that scaled the loss produced by that training example. They trained a softmax regression model to minimize training loss, and trained the hyperparameters (the loss weights) to minimize validation error. Once the hyperparameters were tuned, they created a cleaned training subset from all examples whose loss weight hyperparameter was not zero. They also restricted the L1 norm of the vector of loss weights. Because the number of hyperparameters was high, they used the reverse-mode hypergradient calculation. The training was able to rule out the corrupted examples, and even started to rule out correct examples that increased validation accuracy **and test accuracy**.

### learning task interactions

This was interesting, but to really understand what was going on I think you need to read the whole thing. Basically, the multitask learning (MTL) setup has a matrix of relationship strength between output classes, and they were able to learn those as hyperparameters.

### phone classification

The final task was phone classification on the TIMIT corpus. They achieved marginal improvements by learning the learning rate, momentum, and a weight in the loss function using real-time forward-mode hypergradient optimization. They even tried starting all three hyperparameters at zero, and achieved results that were only slightly worse than when starting with good initial guesses from previous papers. Random search failed to perform much better than the vanilla baseline.

The authors included plots of the hyperparameters over time for the zero-initialized experiment, and I noticed that learning rate and momentum both rose and then dropped to zero in rather parabolic fashion. I would like to see the same plots but for the experiment with reasonable initial values. Do the learning rate and momentum eventually drop to zero in that experiment as well, or do they hold more steady?

## conclusion

You just have to love a paper that refers to hyper-hyperparameters.
