---
title: "the effects of scale on worst-group performance"
date: 2022-07-18T15:31:12-04:00
draft: false
tags: ["deep-learning", "neural-scaling", "generalization", "research-notes"]
---

I think it's valuable to be working in the open whenever possible, so I'm going to keep my research notes here. These notes will hopefully be full of good (and bad) ideas, so if someone borrows a good idea and publishes on it, that's great!

This post contains my research notes as I try to understand how model scaling affects worst-group performance. This started as a group project in the neural scaling laws course at Mila in winter 2022. We presented about an existing [paper]({{< relref "effect-of-model-size-on-worst-group-generalization.md" >}}) and presented our preliminary results [in class](https://sites.google.com/view/nsl-course/schedule#h.o7ntdr3dzoiv). The repository for this project is [here](https://github.com/kylrth/worst_group_scale/).

Here's my executive summary of what we accomplished during the semester:

- We wrote a solid training routine with the following options:
  - **datasets**: [CelebA](https://mmlab.ie.cuhk.edu.hk/projects/CelebA.html) (hair color prediction), [Waterbirds](https://github.com/kohpangwei/group_DRO#waterbirds); easily extensible to other datasets in [WILDS](https://github.com/p-lambda/wilds)
  - **models**: ResNets, ViT; need to extend to sizes not provided by PyTorch
  - **pretraining**: ImageNet pretraining, randomly initialized; need to extend to sizes not provided by PyTorch
  - **objective**: [ERM](https://en.wikipedia.org/wiki/Empirical_risk_minimization), [IRM](https://arxiv.org/abs/1907.02893), [ILC](https://arxiv.org/abs/2009.00329)
- We ran one experiment across each combination of options,{{% sidenote %}}During the semester we were unable run experiments with ILC for models larger than ResNet18. ILC is very storage intensive because it has to compute masks across individual samples in a batch. We didn't take the time to try multi-GPU training.{{% /sidenote %}} and were surprised to find no consistent trends. Often, the difficult part of demonstrating scaling behavior is finding the optimal set of hyperparameters for each size (observable in [*Deep Learning Scaling is Predictable, Empirically*]({{< relref "scaling-predictable-empirically.md" >}})). We expect to see consistency by running more experiments with different seeds and optimizing over hyperparameters.

## 2022-07-18

This week I got access to some compute with [Stability.ai](https://stability.ai/). I've started just the pretrained ResNet ERM experiments from the class project but with 10 different seeds for each experiment, so I can get an idea of the variability in performance. Next I'm going to try varying some hyperparameters.{{% sidenote %}}I'm trying to decide if I should use [hyperopt](https://hyperopt.github.io/hyperopt/) for this experiment. It seems like the right choice because [random search is better than grid search](https://www.jmlr.org/papers/volume13/bergstra12a/bergstra12a.pdf), but it means it will take a lot longer to "get a number" for each individual point on the plots. But it will help me avoid the mistake of placing too much stock in any one hyperparameter value or result. I'll need to figure out some way to let my hyperparameter priors reflect past experiments when I restart a job.{{% /sidenote %}}

## 2022-07-27

Here are the results from the simple experiment I mentioned last time. Each line is averaged over 11 seeds. Click to zoom:

{{< zoom-img src="https://raw.githubusercontent.com/kylrth/worst_group_scale/5bf2b798cdaa84540dae63e47230de35b8356dca/plots/celebA_resnet_erm_pretrained.png" >}}

{{< zoom-img src="https://raw.githubusercontent.com/kylrth/worst_group_scale/5bf2b798cdaa84540dae63e47230de35b8356dca/plots/waterbirds_resnet_erm_pretrained.png" >}}

For CelebA, there's no consistent improvement to the disparity ratio with model scale. For waterbirds, there is a bit of a relationship, and that was true in the limited experiments for the class project as well. This makes me wonder if the hyperparameters are not tuned right for the size of CelebA, which makes me think hyperparameter optimization is going to be valuable in general. I'm working on integrating hyperopt now.
