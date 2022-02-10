---
title: "Data scaling laws in NMT: the effect of noise and architecture"
link: "https://arxiv.org/abs/2202.01994"
date: 2022-02-09T20:47:59-05:00
draft: true
tags: ["deep-learning", "neural-scaling"]
mathjax: true
---

This paper is all about trying a bunch of different changes to the training setup to see what affects the power law exponent **over dataset size**. Here are the answers:

- **encoder-decoder size asymmetry**: exponent not affected, but effective model capacity affected
- **architecture (LSTM vs. Transformer)**: exponent not affected, but effective model capacity affected

Here are some other things to test that I thought of while I read this:

- compare scaling with respect to language pairs (the architecture experiments saw `\(p=0.28\)` and `\(p=0.25\)` for en -> de and zh -> en respectively. Is that difference significant?)
- compare multiple datasets for the same exact task across sizes (i.e. does data collection method matter?)
