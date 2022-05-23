---
title: "Inductive biases for deep learning of higher-level cognition"
link: "https://arxiv.org/abs/2011.15091"
date: 2020-12-08T06:40:48-07:00
draft: false
tags: ["deep-learning", "generalization"]
---

*This is a long paper, so a lot of my writing here is an attempt to condense the discussion. I've taken the liberty to pull exact phrases and structure from the paper without explicitly using quotes.*

> Our main hypothesis is that deep learning succeeded in part because of a set of inductive biases, but that additional ones should be added in order to go from good in-distribution generalization in highly supervised learning tasks (or where strong and dense rewards are available), such as object recognition in images, to strong out-of-distribution generalization and transfer learning to new tasks with low sample complexity.

Larger and more diverse datasets is important but insufficient without good architectural inductive biases. The assumption with the "more data" approach is that if we more accurately cover the true distribution the models will generalize. Humans are able to effectively reason about entirely different tasks and distributions not because they have enough data but because they have a good internal representation.

An important question for the authors is how knowledge can be represented in these two forms, the implicit -- intuitive and difficult to verbalize -- and the explicit -- which allows humans to share part of their thinking process through natural language. This requires going beyond the statistical approach that has guided the DL and ML algorithms we've pursued recently.

## about inductive biases

Here are some of the inductive biases present in current models, copied from Table 1 of the paper:

| inductive bias | corresponding property |
|---|---|
| distributed representations | patterns of features |
| convolution | group equivariance (usually over space) |
| deep architectures | complicated functions = composition of simpler ones |
| graph neural networks | equivariance over entities and relations |
| recurrent nets | equivariance over time |
| soft attention | equivariance over permutations |

The process of converting reasonable inductive biases to algorithms is not trivial. Often that is the core contribution of ML papers. In a way one can think of inductive biases as "training data in disguise", with some inductive biases being equivalent to more or less data. Some of the most powerful contributions to ML generalization have been toward "compositionality": distributed representations, depth, and attention. On large datasets the advantage is reduced, implying that a good place to test generalization power is in transfer (zero-shot or few-shot) settings.

The physical world is more complicated than the worlds where reinforcement learning is successful, and yet humans have a generative causal understanding of the world. That understanding is sometimes incorrect, but still quite functional. Humans perform simulations of past or future events, but those simulations aren't detailed simulations: they only include variables that matter to the simulation. "This sparsity of the dependencies and of the causal reasoning steps which humans capture in their verbalizable thoughts is another inductive prior which we wish to add to the deep learning toolbox."

Machine learning training depends on the assumption of i.i.d. data, but that's not what happens in reality. In reality, the distribution changes every time something acts to change it. New events occur and then the distribution changes as newer events are affected. New statements are made and then the distribution changes as newer statements refer to them. (Now this is me going out on a limb:) maybe our models are hampered by the very notion of collecting data into a dataset that has no reference to time.

The authors talk about meta-learning being similar to the scaled hierarchy of learning through time experienced by humans:

- evolution
- cultural evolution
- individual lifetime learning
- specific task learning
- motor control and direct planning

As knowledge learning is shifted up the hierarchy, it is able to be applied to lower areas of the hierarchy without having to learn it anew.

Current methods take a hit in performance when particular combinations of linguistic concepts are not included in the training data but are present in the test data. But humans have a compositional representation of language that allows them to avoid this. We need to redefine metrics of success to be based on the ability to generalize to out-of-distribution test data.
