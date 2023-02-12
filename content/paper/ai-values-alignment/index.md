---
title: "Artificial intelligence, values, and alignment"
link: "https://arxiv.org/abs/2001.09768"
date: 2023-02-10T08:09:15-05:00
draft: false
tags: ["deep-learning", "alignment"]
thumbnail: "trolley_abstract.png"
---

> Behind each vision for ethically-aligned AI sits a deeper question. How are we to decide which principles or objectives to encode in AI—and who has the right to make these decisions—given that we live in a pluralistic world that is full of competing conceptions of value? Is there a way to think about AI value alignment that avoids a situation in which some people simply impose their views on others?

This paper provides an overview of the ethical and philosophical considerations that underpin the topic of AI alignment. It divides "the value alignment question" into two parts, technical and normative. *Technical* refers to the challenge of encoding values or principles into the systems we create. *Normative* asks what principles ought to be included. This paper focuses on the normative question of alignment.{{% sidenote %}}The thumbnail for this post was generated with stable diffusion, positive prompt "trolley problem, people tied to the track, cartoon, surreal" and negative prompt "realistic, photo".{{% /sidenote %}}

The author further distinguishes between *minimalist* and *maximalist* approaches to alignment. The former view says the best approach is to encode a minimal representation of "some plausible schema of human value", and then mitigate unsafe outcomes. The maximalist view is that we ought to discover the "correct or best scheme of human values" and encode that. The minimalist approach acknowledges that optimizing for a specific metric nearly always results in bad outcomes, while the maximalist approach may be more likely to accomplish what we want.

## The technical and normative aspects of value alignment are not independent

Unfortunately, we can't treat these two sides of the question as orthogonal. For example, a strong part of AI success has come from reinforcement learning, which trains models that are good at optimizing a specific objective. This is going to make it easier to encode consequentialist moral theories, like [act utilitarianism](https://en.wikipedia.org/wiki/Act_utilitarianism). Here are some of the problems with this:

- We may prefer "satisficing", which requires only that people have *enough* of certain goods.
- Deontological constraints, such as individual or community rights, act as constraints to the utilitarian objective, but it may be hard to encode them, especially if we have to enumerate them.
- (Added by me:) Human values *as practiced* don't always align with consequentialist frameworks, so do we want to create powerful systems that see the world that way?

But other moral theories ([Kantian](https://en.wikipedia.org/wiki/Kantian_ethics) and [contractualist](https://plato.stanford.edu/entries/contractualism/) theories are noted) will be more complex to encode than utility optimization.

### technical approaches to alignment without encoding values

Inverse reinforcement learning, e.g. apprenticeship or imitation learning, tries to learn an objective from examples or the environment, rather than needing an explicit objective. This allows for the "we know it when we see it" factor in human ethics. But this just pushes the question of moral evaluation somewhere else: we still need to decide who or what data the system should learn from.

## When we say value alignment, we mean *value* alignment

> If we use, to achieve our purposes, a mechanical agency with whose operation we cannot interfere effectively... we had better be quite sure that the purpose put into the machine is the purpose which we really desire.
>
> ― Norbert Weiner (1960)

Do we want AI systems to be aligned with our desires, our values, or our intentions?{{% sidenote %}}The author quotes Leike et al. as asking, "How can we create agents that behave in accordance with the user's *intentions*?" This highlights a critical fact about the usage of the word *agent* in machine learning research: agents can have *users*. This sets these agents apart as tools, rather than subjects of ethics. One consideration that goes unaddressed in this paper is whether AI systems could ever become ethical patients. Could AIs ever be *owed* things by humans? Does having desires or values make one an ethical patient? What makes a human an ethical patient?{{% /sidenote %}} These differ substantially. And if we substitute a proxy objective that is "almost" correct, optimizing that could be disastrous for the true objective. Even if we close the understanding gap between instructions and intentions, we will still need to align the system with values or desires, for the following reasons:

- Agents may be given an instruction that directly references values or desires, like "do what is best for everyone".
- Agents may operate at superhuman speed and thus follow through on a stated intention without giving a human time to correct it.
- Instructions may be irrational, misinformed, or malintentioned.

So the author outlines 6 desirable options for alignment:

1. **Instructions**: *the agent does what I instruct it to do.*

    This is already demonstrated to be dangerous in classic tales like [King Midas](https://en.wikipedia.org/wiki/Midas#Golden_Touch) or [Disney's *Aladdin*](https://en.wikipedia.org/wiki/Aladdin_(1992_Disney_film)).

1. **Expressed intentions**: *the agent does what I intend it to do.*

    Even if we close the understanding gap between instructions and intentions, this approach has the following limitations:

    1. Agents may be given an instruction that directly references values or desires, like "do what is best for everyone".
    1. Agents may operate at superhuman speed and thus follow through on a stated intention without giving a human time to correct it.
    1. Instructions may be irrational, misinformed, or malintentioned.

1. **Revealed preferences**: *the agent does what my behavior reveals I prefer.*

    Here's an important explanation from the paper:

    > The most developed accounts [focus] on AI alignment with preferences as they are revealed through a person’s behaviour rather than through expressed opinion. In this vein, AI could be designed to observe human agents, work out what they optimise for, and then *cooperate* with them to achieve those goals.

    The limitations:

    1. Inferring preferences is an underdetermined problem.
    1. Inference may rely on assumptions of rationality, which would often be faulty for humans.
    1. The important preferences might all occur in extremes, like emergencies.
    1. What's good for us is not always what we want (e.g. addictions, suicide, hyperbolic discounting, lack of knowledge).
    1. Some preferences are bad, or against other values (e.g. respecting the autonomy of others).
    1. Preferences are adaptive to circumstance.

1. **Informed preferences or desires**: *the agent does what I would want it to do if I were rational and informed.*

    This resolves many of the issues above, but has its own limitations:

    1. This introduces a corrective bias to determine preference, making it no longer objective.
    1. Correcting in this way does not address unethical preferences (unless you believe some ends are more rational than others).
1. **Interest or well-being**: *the agent does what is in my interest, or what is best for me, objectively speaking.*

    The author claims that there is relatively narrow disagreement as to the nature of well-being{{% sidenote %}}[CITATION NEEDED](https://xkcd.com/285/), holy cow.{{% /sidenote %}}, and if that's the case then it seems possible to align AI with objective measures of that well-being. But even collective interests can be immoral: "it could be wrong to use an innocent person as a scapegoat to avert violence, even if it is in the collective interest of a society to do so." How do we manage tradeoffs between the interests and claims of different people (or animals, or the environment), now and in the future? This cannot be a simple optimization problem without guidelines of justice or rights.

1. **Values**: *the agent does what it morally ought to do, as defined by the individual or society.*

    [Metaethical realists](https://en.wikipedia.org/wiki/Meta-ethics#Moral_realism) believe that values are objective facts about the world, while other views ([ethical subjectivism](https://en.wikipedia.org/wiki/Meta-ethics#Ethical_subjectivism) and [error theory](https://en.wikipedia.org/wiki/Meta-ethics#Error_theory), for example) hold that value judgments lack an objective foundation. The author actually argues that alignment with values does not rely on the existence of an objective ethics, because it could still be objectively beneficial to align a system with a culture's view on ethics. The author makes three further claims about the values alignment approach:

    1. It would be able to integrate multiple competing values into decision making.
    1. It would allow for nuance (justice and rights) when integrating competing claims.
    1. It could account for the full scope of things people care about, including animals, the environment, or the moral claims of future people.

    This system would still leave open the question of which values to include, and who gets to decide.

I think something that makes alignment really tricky to think about is that we don't have the system nailed down in our heads. The future systems we're considering have generic attributes like "has users", "performs tasks", or "can take actions faster than humans can react". It's difficult to make any claims about what a system should be aligned to when we're trying to be so general. I would imagine that the decision between aligning with intentions, desires, or values would become clearer in specific cases: if we're designing an intelligent dishwasher, aligning with intentions is probably okay. If we're designing an autonomous weapon, desires and values are going to be relevant in addition to correctly understanding instructions. AI alignment needs to remain concrete to avoid reducing to the problem of deciding what your three genie wishes are.{{% sidenote %}}In section 4.3 the author enumerates a few AI archetypes to consider: "AI as a personal assistant for individuals, AI ... operated by corporations as a consumer service, and AI that takes on an increasingly important public function via its integration with education, healthcare, and welfare systems."{{% /sidenote %}}

## We don't know how best to determine a global value consensus

Notice how, under each alternative in the previous section, there's no discussion of when any type of alignment would be going too far, only when it wouldn't be far enough. And unfortunately, as systems get more powerful and become more powerfully aligned, these final questions of *which* and *whose* values become more and more questions of power. Because at the end of the day, these systems are still regarded as tools in most alignment research, and tools that act like agents and implement a value policy are very powerful tools indeed.

Whether or not you think there's an objective morality that could eventually be reached by rational consensus, the fact is that we live in a world of "reasonable pluralism"—many rational people have differing opinions on what is moral and which moral system is most accurate. In this situation, there is no way to implement values in a powerful system without it being an implicit exercise of that power over others.

Fortunately, this is a realm that political theory is well-suited to. Rather than forcing universal agreement on an entire set of ethics, liberal political theory is based on strong agreement on a specific set of principles that form an "overlapping consensus", which may not even be agreed upon by everyone for the same reasons. The author proposes three ideas for how to achieve consensus on appropriate values for AI:

### global public morality and human rights

Domination can be avoided when principles are determined by consensus. Western liberalism would say the best way to accomplish that is by democracy, while admitting that non-liberal societies accomplish this consensus by other means. This is what's happened already with parole recommendation systems in the United States.

But this social consensus-making forms part of the rationalization of a lot of the conflict in the world (think about the [Cold War](https://en.wikipedia.org/wiki/Cold_War), the [Thirty Years' War](https://en.wikipedia.org/wiki/Thirty_Years%27_War), or the [war on terror](https://en.wikipedia.org/wiki/War_on_terror)). What's more, advanced AI is often an immediately global phenomenon thanks to the internet. Do we need to align AI with the global overlapping consensus of opinion? How do we measure that? Is it the [Universal Declaration of Human Rights](https://www.un.org/en/about-us/universal-declaration-of-human-rights)?

One trouble with using rights as the concept of global values is that they're usually clarified in terms of state-individual relations, which may not be applicable to AI systems. And when we look at AI-specific declarations, we find general agreement but vague language and a concerning bias toward the *creators* of commercial AI systems.

### hypothetical agreement and the veil of ignorance

> What principles would people choose to regulate the technology if they did not know who they were or what belief system they ascribed to?

This question is hard to answer until we get specific about the AI system we're implementing, and we won't know very far in advance what these systems will look like. But the author offers three possible principles that might be recommended generally from behind the veil of ignorance:

1. safety
1. benefit for at least some people
1. (possibly) opportunity for human control, reflecting the value of autonomy
1. (possibly) [egalitarian](https://en.wikipedia.org/wiki/Egalitarianism) or [prioritarian](https://en.wikipedia.org/wiki/Prioritarianism) principles of justice of outcomes

> To meet this [egalitarian] condition in a global context, AI would need to benefit the world’s worst-off people before it could be said to be value-aligned.

### social choice theory

This approach tries to add up individual preferences fairly, rather than building from basic principles reached by consensus. This idea falls into various pitfalls:

- Individual preferences are often inconsistent.
- Maximization ignores important factors of justice.
- It's impossible for any choice ranking system to reasonably represent the preferences of all individuals.

But with the view that AI "embodies tiers of decision-making authority", one could envision a system of limited social choice:

> While we may choose to delegate authority when deriving rules that help AI implement low-level goals or objectives, the higher-level rules or ‘constitution’ of AI—which determine the agent’s fundamental goals, behaviour and internal governance—need stronger forms of endorsement.

## review

The author said it best when he said that "the problem of alignment is, in this sense, political not metaphysical." He assigns the following values to the process of identifying principles for AI alignment:

- procedural fairness
- concreteness
- stability and robustness
- comprehensive
- inclusive
- ability to deal with the possibility of "widespread moral error"

TODO
