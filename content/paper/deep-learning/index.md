---
title: "Deep learning"
link: "https://www.nature.com/articles/nature14539"
date: 2022-01-20T15:11:00-05:00
draft: false
tags: ["deep-learning"]
thumbnail: "samoyed.png"
---

*This post was created as an assignment in Bang Liu's [IFT6289](http://www-labs.iro.umontreal.ca/~liubang/IFT%206289%20-%20Winter%202022.htm) course in winter 2022. The structure of the post follows the structure of the assignment: summarization followed by my own comments.*

## paper summarization

The authors use the example of distinguishing between a Samoyed and a white wolf to talk about the importance of learning to rely on very small variations while ignoring others. While shallow classifiers must rely on human-crafted features which are expensive to build and always imperfect, deep classifiers are expected to learn their own features by applying a "general-purpose learning procedure" to learn the features and the classification layer from the data simultaneously.

The idea of using stochastic gradient descent (SGD) with gradient backpropagation was formulated independently several times in the 1970s and 1980s, but it was generally thought that gradient descent would be trapped by local minima. Recent analysis showed that good saddle points exist in large number in the optimization space, allowing the descent algorithm to be successful more often than had been expected. Interest in deep learning returned around 2006, and a few innovations (GPU inference, unsupervised pretraining) led to some marked advancements in the field.

Convolutional neural networks are inspired by the visual processing present in primate brains, and take advantage of the location-invariance of features in natural data. Convolutional layers contain a bank of learnable filters that are applied across the entire input, and pooling layers are used to "coarse-grain" the positions of features. Convolutional networks gained popularity following the 2012 ImageNet competition where a ConvNet trained on web images managed to cut the best error rates in half. The success was attributed to the use of GPUs, ReLUs, dropout, and data augmentation.

Neural language models learn to predict a next word given the context of earlier words. In the process of training a neural language model, it was discovered that the produced vectors had distributed representations that coincided with human intuition about the similarity of words, i.e. vectors for Norway and Sweden are very similar.

RNNs have required some research effort in order to solve their vanishing/exploding gradient problems, but are very good at language modeling and sequence-to-sequence translation. RNNs tend to struggle to hold onto long-term dependencies, and so LSTMs were devised as a way to explicitly provide RNNs with memory that naturally stores information for a long time. Other approaches like Neural Turing Machines and memory networks have been shown to be able to learn algorithms, not just functions.

Looking ahead, the authors expect to see great improvements in the areas of unsupervised learning, reinforcement learning for vision, natural language understanding, and reasoning.

## comments

This was the first time I've read about the importance of unsupervised pretraining as the kick-start to the early modern advancements in deep learning. It was interesting to learn how important that was to unlocking the potential of deeper models, particularly on smaller datasets, and how ReLU apparently resolved much of the need for pretraining.

It's also interesting to read about language modeling from a pre-attention perspective. I think this entire article would have been written completely differently only 4 or 5 years later due to the amazing advances achieved by transformer models.
