---
title: "Distributed representations of words and phrases and their compositionality"
link: "https://proceedings.neurips.cc/paper/2013/hash/9aa42b31882ec039965f3c4923ce901b-Abstract.html"
date: 2022-02-01T16:09:19-05:00
draft: false
tags: ["deep-learning", "nlp"]
mathjax: true
---

*This post was created as an assignment in Bang Liu's [IFT6289](http://www-labs.iro.umontreal.ca/~liubang/IFT%206289%20-%20Winter%202022.htm) course in winter 2022. The structure of the post follows the structure of the assignment: summarization followed by my own comments.*

## paper summarization

This paper describes multiple improvements that are made to the original [Skip-gram](https://arxiv.org/abs/1301.3781) model:

1. Decreasing the rate of exposure to common words improves the training speed and increases the model's accuracy on infrequent words.
1. A new training target they call "negative sampling" improves the training speed and the model's accuracy on frequent words.
1. Allowing the model to use phrase vectors improves the expressivity of the model.

### negative sampling

The original Skip-gram model computed probabilities using a hierarchical softmax, which allowed the model to compute only `\(O(\log_2(|V|))\)` probabilities when estimating the probability of a particular word, rather than `\(O(|V|)\)`. Negative sampling, on the other hand, deals directly with the generated vector representations. The negative sampling loss function basically tries to maximize cosine similarity between the input representation of the input word with the output representation of the neighboring word, while decreasing cosine similarity between the input word and a few random vectors. They find that the required number of negative examples decreases as the dataset size increases.

While negative sampling improved performance on an analogy task over the hierarchical softmax, those gains were erased when frequent words were subsampled: the best model was trained with subsampling and hierarchical softmax.

### learning phrases

The authors use a simple approach to recognize phrases: if two tokens appear together in a corpus frequently relative to the counts of each individual token, the two tokens likely form a phrase. This process is performed iteratively to discover multi-word phrases, and phrases over a certain threshold are added to the vocabulary.

## comments

- It was disappointing to learn that subsampling and negative sampling loss made orthogonal improvements in accuracy which could not be combined.
- The improved accuracy seen by decreasing the frequency of common words during training reminds me of the sort of forgetting that continual learning tries to overcome. It's so interesting that the performance of these deep models depends so heavily on the balance of the dataset, despite the model's potential to generalize.
