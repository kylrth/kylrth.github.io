---
title: "Compositional generalization by factorizing alignment and translation"
link: "https://www.aclweb.org/anthology/2020.acl-srw.42.pdf"
date: 2020-07-27T09:11:16-07:00
draft: false
tags: ["generalization"]
---

They had a biRNN with attention for alignment encoding, and then a single linear function of each one-hot encoded word for encoding that single word. Their reasoning was that by separating the alignment from the meaning of individual words the model could more easily generalize to unseen words.
