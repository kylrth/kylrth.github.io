---
title: "Universal phone recognition with a multilingual allophone system"
link: "https://arxiv.org/abs/2002.11800"
date: 2020-06-23T08:33:48-06:00
draft: false
tags: ["speech"]
---

These guys made sure to model allophones. They had an encoder that produced a universal phone set, and then language-specific decoders. This meant they could use data from various languages to train the system. The decoder has an *allophone layer*, followed by other dense trainable layers. The allophone layer is a single trainable dense layer, but was initialized by a bunch of linguists who sat down and described the phone sets belonging to each phoneme in each language present in the training set. They added an L2 penalty to divergence from the original linguist-created matrix.

They link to something called [AlloVera](https://github.com/dmort27/allovera), which is a multi-lingual phoneme-allophone database. They used it to create the allophone mappings.

It might be worth forgetting about the allophone layer entirely, and seeing how the results compare to the original.
