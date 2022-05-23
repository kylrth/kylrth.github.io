---
title: "Deep contextualized word representations"
link: "https://www.aclweb.org/anthology/N18-1202/"
date: 2020-12-03T12:01:43-07:00
draft: false
tags: ["nlp", "embedding"]
---

*This is the original paper introducing Embeddings from Language Models (ELMo).*

> Unlike most widely used word embeddings, ELMo word representations are functions of the entire input sentence.

That's what makes ELMo great: they're *contextualized* word representations, meaning that they can express multiple possible senses of the same word.

Specifically, ELMo representations are a learned linear combination of all layers of an LSTM encoding. The LSTM undergoes general semi-supervised pretraining, but the linear combination is learned *specific to the task*. It's been shown that initial layers in LSTM encoders are more representative of syntax, while later layers tend to represent semantics, so this linear combination is a key advantage that allows ELMo to improve accuracy on tasks ranging from POS tagging to question answering.

As you'd expect, the inclusion of intermediate layers in the overall representation only slightly improves the performance on tasks that measure semantic understanding (see table 2 of the paper).
