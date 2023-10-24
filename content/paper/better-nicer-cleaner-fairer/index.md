---
title: "Better, Nicer, Clearer, Fairer: a critical assessment of the movement for ethical artificial intelligence and machine learning"
link: "https://www.semanticscholar.org/paper/Better%2C-Nicer%2C-Clearer%2C-Fairer%3A-A-Critical-of-the-Greene-Hoffmann/e6bcf7d0e3798aebb7114cdc3d89a55a808b29de"
date: 2023-10-24T12:53:31-04:00
draft: false
tags: ["ethics", "technology", "ai", "politics"]
thumbnail: "daftpunk.png"
thumbnail_alt: "image generated with stable diffusion, positive prompt 'daft punk, board meeting, seated at a wooden table, deliberation'"
---

*I will present this paper in the FATE (fairness, accountability, transparency, ethics) reading group tomorrow (2023-10-25). You can view the slides I'll use [here](https://docs.google.com/presentation/d/1Bl4Bfh-ryFfmsEVrmdnYBe69hKjZP4mYZppvZHU5-yM/edit?usp=sharing).*

There are unresolved tensions in the algorithmic ethics world. Here are two examples:

- Is inclusion always good?
  - Gebru: "you can't have ethical A.I. that's not inclusive... [a]nd whoever is creating the technology is setting the standards"
  - Nelson: "... I struggle to understand why we want to make black communities more cognizant in facial recognition systems that are disproportionately used for surveillance."
- academic activism
  - O'Neil: why is there a lack of academic efforts to inform policymakers and regulators?
  - PERVADE: Academics have been doing this work for a while but it is underfunded, marginalized, and at odds with a US political apparatus generally favorable towards Silicon Valley.

Ethics manifestos or value statements mask these tensions behind a business ethics lens.

## business ethics

> Sociological work on these applied ethics emphasizes how ethics and ethical codes designate and defend social status and expertise more than enforce consistent moral or societal virtues.

- The history of business ethics is boring because it does not develop, but rather responds to scandals by building new internal institutions to preach that "good morals are good business".
- Communicating these claims requires "a *moral background*—a specific arrangement of second-order social assumptions about what ethics mean and how they work, above first-order claims about ethical norms or behaviors."

## ethics statements as discourse

Company ethics statements shape and are shaped by this moral background. The statements "legitimate (and delegitimize) certain practices, providing 'answers to the spoken or unspoken questions "Why should we do this" or "Why should we do this in this way?"'".

The authors use [frame analysis](https://en.wikipedia.org/wiki/Frame_analysis) to understand how 7 important public statements on AI ethics select certain elements of the debate for salience or erasure. They iteratively marked sections of the texts according core themes, updating and adding specificity as the themes were compared across texts.

## findings

They drew 7 core themes from their study of 7 important public statements on AI ethics.

- *The Partnership on AI to Benefit People and Society*: big tech + partners from higher ed, civil rights, other industry
- *The Montreal Declaration for a Responsible Development of Artificial Intelligence*: academics and interested industry practitioners based in Montreal (esp. MILA)
- *The Toronto Declaration*: human rights nonprofits such as Amnesty International and Access Now
- *OpenAI*: venture capitalist-sponsored nonprofit research company
- *The Center for Humane Technology (CHT)*: "former tech insiders who understand the culture..."
- *Fairness, Accountability and Transparency in Machine Learning (FATML)*: interdisciplinary convening of computer scientists, statisticians, and ethicists prompted by Obama's call for a review of the [2014 Big Data report](https://obamawhitehouse.archives.gov/sites/default/files/docs/big_data_privacy_report_may_1_2014.pdf)

### universal concerns, objectively measured

> ... all the statements agree a) the positive and negative impacts of AI are a matter of universal concern, b) there is a shared language of ethical concern across the species, and c) those concerns can be addressed by objectively measuring those impacts. This is a universalist project that brooks little relativist interpretation.

This ethical universalism is often justified by subtle use of biological essentialism, e.g. references to "all of society" or "all sentient creatures".

Commonly, the solution to these concerns is to objectively measure harm through "computationally rigorous methods" prioritizing "accuracy".

### expert oversight

> ... primarily technical, and secondarily legal, experts come together to articulate concerns and implement primarily technical, and secondarily legal solutions.

Most statements divide people into "the public" and "stakeholders", or "experts" and "other stakeholders". "Experts make AI happen, Other Stakeholders have AI happen to them."

Less frequently do statements acknowledge "non-technical" expertise, like human rights law.

### values-driven determinism

AI is seen as a world-historical shift to which humans can only react, while it's also stressed that we can apply our values to it through human agency.

The automation of labor is frequently taken as a given, and the possibility of *not* doing something is only sometimes barely mentioned as an option. For example, the Toronto Declaration stresses that care should be taken when collecting/using data from sensitive groups, but the data collection itself is taken as a given.

### design as locus of ethical scrutiny

> Business decisions are never positioned as needing the same level of scrutiny as design decisions.

Statements tend to detail individual professional responsibility without critiquing larger business interests or professions in general. This is especially problematic in a field dominated by extremely capitalized corporations.

The CHT tries to take a strong stand against attention hacking but fails because its recommendations focus on design considerations and avoid critiques of business practice.

### better building

Some statements set up clear red lines, but far from anything useful:

- (Montreal) run an abattoir or kill an animal
- (Partnership) violate international conventions or human rights

Others avoid it or hedge quite a bit:

- (Axon) from CEO: "It would be both naive and counterproductive to say law enforcement shouldn't have these new technologies."
- (Toronto) "Where the risk of discrimination or other rights violations has been assessed to be too high or impossible to mitigate the private sector should consider not deploying a machine learning application.”

None set up a comprehensive framework for deciding what not to build.

### stakeholder-driven legitimacy

> Proponents of ethical design often articulate a desire to open or sustain conversations by engaging as many stakeholders—largely experts—as possible. This positions ethical design as ethical, in part, because it is given a thorough vetting. Vetting legitimates decisions through an appeal to transparency, but without specifying any subsequent substantive commitments.

Axon is apparently trying to put on the appearance of transparency by engaging experts through their ethical board. In this way, they can "include in the conversation" a wider variety of experts without actually substantively changing their products.

### machine translation

Many statements prioritize transparency and explainability of systems.{{% sidenote %}}While reading this, I'm thinking about the [paper on fairwashing](https://proceedings.mlr.press/v97/aivodji19a) referenced in Abigail Thorn's ["Here's what ethical AI really means"](https://www.youtube.com/watch?v=AaU6tI2pb3M) ([transcript](https://dl.kylrth.com/transcripts/ethical_ai.txt)), which demonstrates that (at least with current explainability tools) it's always possible to provide an explanation that appears reasonable even for a model known to be unfair. And as Thorn goes on to say, a focus on model interpretability ignores the political question of how individuals interacting with institutions are supposed to accept or respond to the explanations those institutions give. When we frame automation in general as "encoding ways of seeing", machine learning becomes a really useful tool for institutions that want to make cheap decisions without doing the work to a) encoding their ways of seeing explicitly or b) make those decisions transparent (much less accountable) to the individuals being processed.{{% /sidenote %}}

## main takeaways

1. Conversation around ethical AI is/should be centered on technical experts, who should define good metaphors for the public to use to understand AI. Other experts should be consulted, but decision-making should rest with AI practitioners.
2. The picture of moral causation provided by these statements is as follows: "Poor ethics lead to bad designs, which produce harmful outcomes." Compare this narrative with other possibilities:
	- the chaos of new, intelligent tools interacting in the wild
	- large corporations dominating political processes with no democratic accountability

	This is (surprisingly) in line with critical lenses like values in design (VID), but lacking the "often explicit focus on normative ends devoted to social justice or equitable human flourishing".
