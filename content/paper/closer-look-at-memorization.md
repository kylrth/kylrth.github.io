---
title: "A closer look at memorization in deep networks"
link: "https://arxiv.org/abs/1706.05394"
date: 2020-08-31T11:52:35-06:00
draft: false
tags: ["deep-learning", "generalization"]
mathjax: true
---

This paper builds on what we learned in ["Understanding deep learning requires rethinking generalization"]({{< relref "understanding-requires-rethinking-generalization.md" >}}). In that paper they showed that DNNs are able to fit pure noise in the same amount of time as it can fit real data, which means that our optimization algorithm (SGD, Adam, etc.) is not what's keeping DNNs from overfitting.

## experiments for detecting easy/hard samples

It looks like there are qualitative differences between a DNN that has memorized some data and a DNN that has seen real data. In experiments they found that real datasets contain "easy examples" that are more quickly learned than the hard examples. This is not the case for random data.

The second way they detected this pattern was by measuring something called *loss sensitivity*, which they defined as the gradient of the loss with respect to each training example after several SGD updates. An example with high loss sensitivity has a greater effect on future values of the loss. For random data, all samples have high loss sensitivity, while in real data only a few examples do.

**I wonder what would happen if you used loss sensitivity to throw out training examples. Would the model generalize better?**

The *Gini coefficient* is a measure of the inequality among values in a frequency distribution. 0 means all values are the same, while 1 means all values are different. They found that the Gini coefficient of loss sensitivity ended up much higher for real data than for random data. Surprisingly, this was even true when the model was tasked with giving each example a unique class, which is essentially the task of memorization.

In another experiment, they collected *per-class loss sensitivity*, or how sensitive class `\(i\)` loss was to class `\(j\)` examples. For random data, this value was only high when `\(i=j\)`, but for real data there were apparently some useful cross-class features that the model learned, resulting in higher values for per-class loss sensitivity when `\(i\)` was not equal to `\(j\)`.

In another experiment, they found that as they increased the amount of random data in the training set, they required a higher capacity model in order to generalize to the validation data. This opposes the classical understanding that a smaller model will be less expressive and therefore be required to focus on the patterns in the true data. The authors theorize that larger models are able to memorize the noise data in a way that allows it to still remember the patterns in the true data.

In another experiment, they found that *time to convergence* (the time it takes to reach 100% accuracy on the training set) is much more drastically affected by model size and training set size when the data is random than when the data is real. This suggests that for real data the model is not memorizing.

## critical sample ratio

They define *critical sample ratio* (CSR) as the proportion of samples that are close to a decision boundary. These *critical samples* are often used to find adversarial examples. Throughout training, the authors periodically found the CSR of the validation set with respect to the current state of the model. They found that models trained with higher noise had systematically higher CSRs. This means the learned decision surface is much more complex for models trained on noise. They also found that CSR gradually increased for all datasets before stabilizing after a few epochs. This means that the hypotheses of the network grew gradually more complex until a certain point. When exposed to a certain percentage of noisy labels, the network appeared to first learn on the real data before trying to memorize the noisy data, because validation accuracy actually increased before decreasing.

## regularization

Through a series of experiments they proved that regularization serves to disable the memorization capability of the network, without harming the generalization capacity. They found that dropout was the most powerful of these regularization techniques.

## conclusion

Dropout is great because it limits memorization as well as catastrophic forgetting (shown by a different paper). SGD seems to prioritize learning simple models first (hence the value of early stopping). We're still not sure why networks choose to model patterns over memorization, but this work seems to suggest that it's an inherent bias of the model architecture and optimization method.
