---
title: "Scaling laws for the few-shot adaptation of pre-trained image classifiers"
link: "https://arxiv.org/abs/2110.06990"
date: 2022-02-22T13:19:12-05:00
draft: false
tags: ["deep-learning", "neural-scaling"]
---

The unsurprising result here is that few-shot performance scales predictably with pre-training dataset size under traditional fine-tuning, matching network, and prototypical network approaches.

The interesting result is that the exponents of these three approaches were substantially different (see Table 1 in the paper), which says to me that the few-shot inference approach matters a lot.

The surprising result was that while more training on the "non-natural" [Omniglot](https://github.com/brendenlake/omniglot) dataset did not improve few-shot accuracy on other datasets, training on "natural" datasets *did* improve accuracy on few-shot Omniglot.
