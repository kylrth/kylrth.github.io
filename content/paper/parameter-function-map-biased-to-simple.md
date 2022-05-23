---
title: "Deep learning generalizes because the parameter-function map is biased towards simple functions"
link: "https://arxiv.org/abs/1805.08522"
date: 2020-09-08T07:29:09-06:00
draft: false
tags: ["generalization"]
---

The theoretical value in talking about the parameter-function map is that this map lets us talk about sets of parameters that produce the same function. In this paper they used some recently proven stuff from algorithmic information theory (AIT) to show that for neural networks the parameter-function map is biased toward functions with low Komolgorov complexity, meaning that simple functions are more likely to appear given random choice of parameters. Since real world problems are also biased toward simple functions, this could explain the generalization/memorization results found by [Zhang *et al*]({{< relref "understanding-requires-rethinking-generalization" >}}).
