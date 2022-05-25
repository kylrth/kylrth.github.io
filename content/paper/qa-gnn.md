---
title: "QA-GNN: reasoning with language models and knowledge graphs for question answering"
link: "https://arxiv.org/abs/2104.06378"
date: 2022-04-05T22:54:43-04:00
draft: false
tags: ["deep-learning", "question-answering"]
---

*This post was created as an assignment in Bang Liu's [IFT6289](https://www-labs.iro.umontreal.ca/~liubang/IFT%206289%20-%20Winter%202022.htm) course in winter 2022. The structure of the post follows the structure of the assignment: summarization followed by my own comments.*

The authors create a novel system for combining an LM and a knowledge graph by performing reasoning over a joint graph produced by the LM and the KG, thus solving the problem of irrelevant entities appearing in the knowledge graph and unifying the representations across the LM and KG.

## paper summarization

Following previous works, the QA-GNN method first encodes the question and possible answers with the LM, and then choose a coarse subgraph of the KG using a graph neural network (hence the "GNN" in the name). Then they add the following innovations:

- They use the LM to compute the likelihood of the concatenation of the question context with the KG entity, and add this information to the graph.
- They use the question context as an extra node added to the knowledge subgraph with a new relationship category.
- They train a new graph neural network with attention to perform message passing over this unified graph.

They end up beating state of the art performance on the *Commonsense* and *OpenBook* datasets by 5.7% and 3.7% respectively, using the same LM as the previous state of the art. What's more, important performance gains came from questions containing negatives, which LMs are known to perform poorly on.

In the ablation studies they found that most of the performance boost over previous work was from the added edges from the question context to the entity nodes.

## comments

These two algorithm innovations feel very natural when I compare them to how I interpret the way my own brain arrives at answers to questions. I would be interested to see a model/data scaling study done on this algorithm vs. previous versions, to know if the better information passing improves the sample efficiency.
