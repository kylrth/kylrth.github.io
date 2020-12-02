---
title: "Google's multilingual neural machine translation system"
link: "https://arxiv.org/pdf/1611.04558.pdf"
date: 2020-06-26T08:02:12-06:00
draft: false
tags: ["nlp", "attention", "machine-translation"]
---

They use the word-piece model from ["Japanese and Korean Voice Search"]({{< relref "word-piece-model.md" >}}), with 32,000 word pieces. (This is a lot less than the 200,000 used in that paper.) They state in the paper that the shared word-piece model is very similar to Byte-Pair-Encoding, which was used for NMT in [this paper](https://www.aclweb.org/anthology/P16-1162.pdf) by researchers at U of Edinburgh.

The model and training process are exactly as in [Google's earlier paper]({{< relref "google-nmt-2016.md" >}}). It takes *3 weeks* on *100 GPUs* to train, even after increasing batch size and learning rate.

They played with oversampling data so that all language pairs were equally represented, performing word-piece segmentation after the fact.

They observed that performance began to degrade after including more languages in the model, but I wonder if that's just because they kept their word-piece models so small? For more languages, I would image you would need more word pieces.

What's cool is that they were able to perform translation between language pairs that weren't seen during training. But adding a little bit of real data for that language pair improved results dramatically.
