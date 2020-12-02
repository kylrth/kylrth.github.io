---
title: "BERT: pre-training of deep bidirectional transformers for language understanding"
link: "https://arxiv.org/abs/1810.04805"
date: 2020-08-04T08:57:44-07:00
draft: false
tags: ["nlp", "attention", "machine-translation"]
---

The B is for bidirectional, and that's a big deal. It makes it possible to do well on sentence-level (NLI, question answering) and token-level tasks (NER, POS tagging). In a unidirectional model, the word "bank" in a sentence like "I made a bank deposit." has only "I made a" as its context, keeping useful information from the model.

Another cool thing is masked language model training (MLM). They train the model by blanking certain words in the sentence and asking the model to guess the missing word.
