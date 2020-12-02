---
title: "Google's neural machine translation system: bridging the gap between human and machine translation"
link: "https://arxiv.org/pdf/1609.08144.pdf"
date: 2020-06-30T08:22:30-06:00
draft: false
tags: ["nlp", "attention", "machine-translation"]
---

*This model was superseded by [this one]({{< relref "google-zero-shot.md" >}}).*

They did some careful things with residual connections to make sure it was very parallelizable. They put each LSTM layer on a separate GPU. They quantized the models such that they could train using full floating-point computations with a couple restrictions and then convert the models to quantized versions.
