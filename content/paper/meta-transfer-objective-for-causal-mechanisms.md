---
title: "A meta-transfer objective for learning to disentangle causal mechanisms"
link: "https://openreview.net/pdf?id=ryxWIgBFPS"
date: 2020-09-21T08:46:30-06:00
draft: false
tags: ["generalization"]
mathjax: true
---

Theoretically, models should be able to predict on out-of-distribution data if their understanding of causal relationships is correct. The toy problem they use in this paper is that of predicting temperature from altitude. If a model is trained on data from Switzerland, the model should ideally be able to correctly predict on data from the Netherlands, even though it hasn't seen elevations that low before.

The main contribution of this paper is that they've found that models tend to transfer *faster* to a new distribution when they learn the correct causal relationships, and when those relationships are *sparsely represented*, meaning they are represented by relatively few nodes in the network. This allowed them to create a meta-learning objective that trains the model to represent the correct causal dependencies, allowing for improved generalization.

The meta-learning objective here is to optimize the regret over choice of weight for the loss over different causal graphs. I'm not quite sure yet how in the toy problem each model is trained based on their separate causal graphs. The phrase "`\(\theta_G^{(t)}\)` aggregates all the modules' parameters in `\(G\)`..." doesn't make sense to me.

Anyway, the point of this paper is not to train a better model but to use this meta-learning objective to tease out the causal graph. It is left to future work to determine how to use this to create models that use these disentangled representations.

*[Learning neural causal models from unknown interventions]({{< relref "neural-causal-models" >}}) is a follow-on to this paper.*
