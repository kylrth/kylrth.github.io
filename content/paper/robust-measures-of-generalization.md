---
title: "In search of robust measures of generalization"
link: "https://papers.nips.cc/paper/2020/hash/86d7c8a08b4aaa1bc7c599473f5dddda-Abstract.html"
date: 2022-02-21T15:33:22-05:00
draft: false
tags: ["deep-learning", "generalization", "neural-scaling"]
mathjax: true
---

These authors define *robust error* as the least upper bound on the expected loss over a family of environmental settings (including dataset, model architecture, learning algorithm, etc.):

`\[\sup_{e\in\mathcal F}\mathbb E_{\omega\in P^e}\left[\ell(\phi,\omega)\right]\]`

The fact that this is an **upper bound** and not an average is very important and is what makes this work unique from previous work in this direction. Indeed, what we should be concerned about is not how poorly a model performs on the *average* sample but on the *worst-case* sample.

They called their main experiments *coupled-network* experiments. They would perform two training runs, only varying the training setup in one dimension (e.g. learning rate or dataset size), and ask the generalization measure `\(C\)` to predict which one would perform better. This they call *sign error* because it's an easier problem than actually predicting the relative error difference. It's also important to note that their experiments excluded comparisons where the difference in error could be chalked up to Monte-Carlo variance.

They ran this across a battery of generalization measures and found that not a single one had better *robust sign error* than a coin flip. They did find some situations in which certain measures were predictive, but every measure had 100% failure in at least one case.

One important area where most measures performed well was in the effect of training dataset size, which isn't very surprising.
