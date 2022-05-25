---
title: "Connectionist temporal classification: labelling unsegmented sequence data with recurrent neural networks"
link: "https://www.cs.toronto.edu/~graves/icml_2006.pdf"
date: 2020-07-10T09:14:59-06:00
draft: false
tags: ["speech"]
---

RNNs generally require pre-segmented training data, but this avoids that need.

Basically, you have the RNN output probabilities for each label (or a blank) for every frame, and then you find the most likely path across that lattice of probabilities.

The section explaining the loss function was kind of complicated. They used their forward-backward algorithm (sort of like Viterbi) to get the probability of all paths corresponding to the output that go through each symbol at each time, and then they differentiated that to get the derivatives with respect to the outputs. Then it was backpropagation as normal from that point.
