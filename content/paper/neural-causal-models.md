---
title: "Learning neural causal models from unknown interventions"
link: "https://arxiv.org/abs/1910.01075"
date: 2020-09-22T10:39:54-06:00
draft: false
tags: ["generalization"]
mathjax: true
---

*This is a follow-on to [A meta-transfer objective for learning to disentangle causal mechanisms]({{< relref "meta-transfer-objective-for-causal-mechanisms" >}})*

Here we describe an algorithm for predicting the causal graph structure of a set of visible random variables, each possibly causally dependent on any of the other variables.

## the algorithm

There are two sets of parameters, the *structural parameters* and the *functional parameters*. The structural parameters compose a matrix where `\(\sigma(\gamma_{ij})\)` represents the belief that variable `\(X_j\)` is a direct cause of `\(X_i\)`. The functional parameters are the parameters of the neural networks that model the conditional probability distribution of each random variable given its parent set.

From here, the algorithm used to learn the graph structure is composed of three steps:

1. graph fitting on observational data
    - draw graph edge strengths from a Bernoulli distribution (with `\(\sigma(\gamma_{ij})\)` as the parameter) to create a possible graph configuration
    - draw batches of observational data
    - maximize log-likelihood of the batch under the graph configuration using SGD
1. graph scoring on interventional data
    - an intervention is applied (in this case the target node is chosen uniformly randomly)
    - the intervened node is predicted by computing the log-likelihood on a small set of interventional samples, and whichever variable shows the greatest decrease in score is predicted to be the target node
    - some more graphs are sampled based on the structural parameters, and then the log-likelihood over the interventional data is computed for those graphs, except that values from the intervened-upon variable do not contribute to the likelihood (since that value isn't out of the estimated distribution because the distribution is bad but because the value was *changed*)
1. credit assignment to structural parameters
    - the scores calculated in the last step are aggregated to create a gradient for the structural parameters
    - a regularization term is added to keep `\(\gamma_{ij}\)` and `\(\gamma_{ji}\)` from both being high (which reinforces the assumption that the graph is directed and acyclic)

This continues until the structural parameters are all near 0 or 1, meaning that we have become confident in our estimates of the graph structure.

The sampled graphs are important because they are used to force the neural networks to rely only on the values of a node's parents when predicting the value for a node. It appears that this method creates a model that generalizes to unseen interventions.

## benefits of this algorithm

- it naturally allows for a wide variety of intervention types
- it's not combinatorially complex in the number of nodes on the causal graph
- it allows inclusion of partial graph knowledge (simply replace `\(\gamma_{ij}\)` with the known value)

## limitations

Large graphs and dense graphs are progressively more difficult to learn. It also appears that smaller graphs are less sensitive to the regularization hyperparameters.
