---
title: "Troubling trends in machine learning scholarship"
link: "https://arxiv.org/abs/1807.03341"
date: 2020-08-13T10:36:05-07:00
draft: false
tags: ["meta"]
---

The authors discuss four trends in AI research that have negative consequences for the community.

## problems

### explanation vs. speculation

It's important to allow researchers to include speculation, because speculation is what allows ideas to form. But the paper has to carefully couch speculation inside a "Motivations" section or other verbage to ensure the reader understands its place.

It's extremely important to define concepts before using them. Terms like *internal covariate shift* or *coverage* sound like definitions without actually being such.

### failure to identify the sources of empirical gains

If a paper presents more than one tweak or change, there have to be ablation studies.

### mathiness

Don't include equations just to sound more technical. Do it to communicate.

### misuse of language

#### suggestive definitions

Giving something an intuitive name makes it easier for that concept to stick without having to argue for it. Examples include *reading comprehension*, *curiosity*, *thought vector*, and *consciousness prior*.

#### overloading technical terminology

*Deconvolution* is a great example of this. Even worse, some names for tough problems have been reused for easier problems until now *language understanding* and *reading comprehension* refer to making accurate predictions on specific datasets. That's bad.

#### suitcase words

These words carry multiple meanings and cause miscommunication. For example, *model interpretability* has no universally agreed-upon meaning. *Generalization* means three things:

- generalizing from train to test
- generalizing from one population to another
- generalizing from experiments to the real world

and that causes confusion. *Bias* is an example that is more well-known.

Here the authors make the distinction that suitcase words are fine for naming academic departments or setting aspirational goals, but using those terms in technical settings causes confusion.

## causes of the problems

- **complacency in the face of progress**: There's this assumption in ML that "strong results excuse weak arguments", which is completely wrong.

- **growing pains**: Rapid growth makes it more likely for junior researchers to misappropriate terms or technologies. Also, there's a high ratio of papers to reviewers due to this growth, so reviewers are likely to be less experienced.
- **misaligned incentives**: Researchers are incentivized to make titles and claims that sound good to lay readers. Investors and reporters cause researchers to overstate their success.

## solutions

Strong empirical papers have error analysis, ablation studies, and robustness checks. A question to ask yourself when including an explanation: Would I rely on this explanation for making predictions or for getting a system to work? Also, be clear on which problems are solved and which are not.

Reviewers can set better incentives for authors if they ask themselves if they would have accepted the paper had they been less thorough. Retrospective papers that solidify foundations and those that challenge conventional thinking should be emphasized during review.

## counterpoints

Here are some of the counterpoints.

- **careful is slow**: In some cases, taking the time to make a clean paper as described here would be inefficient, and it would be better for community progress if the paper were published immediately and then later efforts were made with ablation studies and other careful examination.
- **careful precludes creativity**: A high standard for publication might impede original ideas, which are more likely to be unusual and speculative.
- **careful requires all things from all contributors**: It might be useful to have some people generating ideas in a fly-by-the-seat-of-your-pants sort of way, and others carefully reviewing work to distill knowledge.

The authors feel that their standards won't take anything more than a few extra days to implement and write, but in cases where ideas can't be shared without breaking the standard, it's better to break it than to leave something unsaid.
