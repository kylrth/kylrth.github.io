---
title: "The consciousness prior"
link: "https://arxiv.org/abs/1709.08568"
date: 2020-08-14T09:05:56-07:00
draft: false
tags: ["generalization"]
mathjax: true
---

System 1 cognitive abilities are about low-level perception and intuitive knowledge. System 2 cognitive abilities can be described verbally, and include things like reasoning, planning, and imagination. In cognitive neuroscience, the "Global Workspace Theory" says that at each moment specific pieces of information become a part of working memory and become globally available to other unconscious computational processes. Relative to the unconscious state, the conscious state is low-dimensional, focusing on a few things. The paper proposes we use an attention mechanism (in the sense of the Bahdanau 2015 paper) to produce the conscious state, and then a VAE or conditional GAN to produce the output from the conscious state.

One interesting note he makes is about the distinction between keys and values. He says the [Transformer architecture]({{< relref "attention-all-you-need" >}}) binds key-value pairs together, instead of just copying the relevant values. I hadn't noticed that.

This is a pretty hypothetical paper, and I think he makes some mistakes because the theory is not grounded in experimentation. For example, equation (6) implies that the utterance at time `\(t\)` depends on the previous utterance, which doesn't make sense to me.

I think the contribution of this paper is its exposition of the consciousness as being a representation of the broader unconscious state that is closely tied to natural language description of world state. This could be useful in an ML context if we used a natural language description of world state as one of the objective functions for the consciousness state in the system.
