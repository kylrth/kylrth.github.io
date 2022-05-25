---
title: "Semi-supervised training for automatic speech recognition"
link: "https://jscholarship.library.jhu.edu/bitstream/handle/1774.2/62262/MANOHAR-DISSERTATION-2019.pdf"
date: 2020-07-14T08:06:00-06:00
draft: false
tags: ["speech"]
---

*This was Manohar's PhD dissertation at JHU.*

Chapter 2 provides a relatively clear overview of how chain and non-chain models work in Kaldi.

In chapter 3 he tried using negative conditional entropy as the loss function for the unsupervised data, and it helped a bit.

In chapter 4 Manohar uses [CTC loss]{{< relref "ctc" >}}.

In chapter 5, he discusses ways to do semi-supervised model training. It's nice when you have parallel data in different domains, because then you can do a student-teacher model. When there's no parallel data, the best you can do is decode the unsupervised data with the seed model and use that to train the LF-MMI model (see section 5.2.1).
