---
title: "Army of none: autonomous weapons and the future of war"
author: "Paul Scharre"
goodreads: "https://www.goodreads.com/book/show/40180025-army-of-none"
date: 2023-02-14T13:33:19-05:00
draft: false
tags: ["ethics", "politics"]
thumbnail: "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1529056546i/40180025.jpg"
---

The examples in this book make it clear that there is no easy line we can draw between autonomous and non-autonomous weapons (and by extension, autonomous AI agents). There is a smooth gradient of autonomy, which makes the question of allowing autonomous weapons much more nuanced. It's probably the case that higher-level alignment becomes important proportionally to the level of autonomy and intelligence.

He analyzes the Patriot fratricides,{{% sidenote %}}In a military context, the word *fratricide* means the killing of someone on the same side of a conflict.{{% /sidenote %}} and ends up blaming the individuals involved for automation bias. I would say that these humans in the system were set up to fail by the training and the functioning of the system. They're expected to decide whether the computer is right, with only seconds to decide. He acknowledges this later when he talks about Aegis.

## robustness

It is simply too difficult to account for all possible outcomes of a complex system: robustness is impossible. Charles Perrow has useful things to say about normal accident theory. 3 mile island had 2000 alarms, and usually more than one went off at once. Air France had a plane hit the ocean due to a simple climbing stall, because the pilots didn't understand what all the automatic systems were doing and what all the indicators were telling them.

There's a tension between normal accident theory and high-reliability organization theory: will accidents always happen eventually, or can we mitigate all risks with enough careful planning and regulation?

[SUBSAFE](https://en.wikipedia.org/wiki/SUBSAFE) is another example of an HRO, along with aviation and nuclear. It influenced [Aegis](https://en.wikipedia.org/wiki/Aegis_Combat_System), which seems to be a very well-managed automated weapons system. Aegis operators are kind of like programmers: they intimately understand the "doctrines" they've written and tested, which outline the kinds of automation the system will perform. And yet despite all this control they still don't trust the automation except when necessary. This is also helpful in a moral context because the responsibility for mistakes still basically lies with human operators.

In [*The limits of safety: organizations, accidents, and nuclear weapons*](https://www.jstor.org/stable/j.ctvzsmf8r), Scott Sagan claims that HRO ideas can only stave off inevitable mistakes.

**Always/never dilemma**: we have to be always ready to fire, but never accidentally fire. There's no way to drive the risk of accidental firing to zero, according to normal accident theory. What's worse is that war time is inherently not normal.

**The question is not whether the automated system's error rate is lower than the human error rate, because (as implemented currently) when an automated system makes an error, it does not realize it has made a mistake. The damage that it can cause is much, much higher. That has to be taken into account when making the risk calculation, but it's difficult to calculate precisely because the system is complex and we don't know all the ways it can fail.**{{% sidenote %}}This idea about relative error rates is something that has entered the public discourse on autonomous driving, and this is an extremely important point that I hope enters the conversation as well.{{% /sidenote %}}

Something like a flash crash could happen in war: a flash war. Drones crossing lines might lead to escalation. Autonomy will lead to unintended escalation, but accidents can't happen nearly as quickly in the physical world as they can in trading. The author says cyber war can happen more at the speed of trading, but I'd like to add that this ignores the large human time investment that current hacks require.

Stuxnet was the first cyber weapon, in that it affected the physical world in a concrete way.

## AGI

When people say something is 50 years out, they don't think it's possible. When they say 20 years, they don't know how it will happen but they think it's possible. AGI is coming into reach as we speak.

The author does a good job covering ideas like the [AI foom](https://en.wikipedia.org/wiki/Technological_singularity#Intelligence_explosion), hard takeoff, and soft takeoff. This book was published in 2018, so it's relatively up to date, but it's missing the meteoric sucess of language models in the last few years.

**"AGI is about personhood."** The fact is that while the military isn't looking at AI technology as a way to create real agents in the real world, it's actually the dream behind a lot of the research.{{% sidenote %}}As I'm listening to this, I'm thinking about the ethics around complex artificial agents. Do we create ethical patients simply by understanding and believing the mechanism that results in the behavior we associate with ethical patients?{{% /sidenote %}} The Turing test is a sign of our anthropocentric bias. Not a great test.

An AI trying to optimize human happiness might bury us in coffins with heroine drips. What's worse, sufficiently intelligent systems will develop desires for resources, continued existence, etc., even if we don't explicitly design it with those desires, simply because it wants to accomplish its own goals. Some of the things we're afraid of AGI doing are things we are afraid of powerful, rational, sociopathic people doing.

"Tool AI" and AGI may be a false dichotomy. Plus, we keep moving the goalposts for what superintelligence is. What humans do might be totally irrelevant to what superintelligence looks like.

Automating systems exposes us to greater danger from hacking.

Can we align AI weapons with IHL guidelines for war? There's already too much ambiguity in modern warfare. Who is an insurgent, who is a plainclothes policeman? Fake surrender is another difficult case.

With autonomous systems, where does the accountability land? When someone starts an autonomous weapon and it does something that constitutes a war crime, do we blame the operator or the developer?

The problem with land mines is that their autonomy continues beyond the original bounds of the engagement in time and space.

## ethics

Consequentialism would say that autonomous weapons are unethical because they will probably increase the harm in the world. That is, unless they make wars more efficient and protect civilians. Autonomous weapons will remove moments of mercy in war. They also will let soldiers become more detached from their killing, which means they will kill more readily. On the other hand, human fighters aren't very ethical. If we create a system that can't break the laws of war, it will do better than we do now.

From a deontological perspective, one could argue that we ought not to relegate the immoral act of killing to automated systems. The author is not convinced by the argument that those killed deserve the dignity of the action being taken by a human. War is already a horror and there is no solace for loved ones in the fact that it was another person who did the killing. What's more convincing is the wrongness of outsourcing the moral dilemma to automated systems. As nations we already hand off a lot of that moral burden to our soldiers, but imagine if even our soldiers handed off the moral burden of their killings to the systems they turned on. From an ethical perspective, it's good that the Aegis operators use their keys so carefully because then the responsibility gets assigned to the humans who are making the decisions.

The problem is that war is already inherently a moral dilemma. It's a rational stance to believe that war is always unethical.

Autonomous weapons might make starting a war easier and ending a war harder. (Starting one might be easier because autonomous systems could inadvertently make acts of escalation, and ending one might be harder because systems we've initiated may not be able to be recalled.) Autonomous systems are rigid, which is good when we can get them to follow the rules, but bad for reevaluating judgements in new contexts.

## strategic stability

Different technologies can be stabilizing or destabilizing. Submarines with nuclear weapons are seen as stabilizing because they eliminate nuclear first strike advantage, while missile defense systems are seen as destabilizing because they enhance first strike advantage. Are autonomous weapons a stabilizing or destabilizing technology? It's hard to say, because autonomy takes so many forms.

In automation, there's a haste that's added that is problematic when humans are out of the loop. Humans ought to be in the loop to override autonomy in cases where the context implies a different action is best. Humans have a projection bias when predicting their own future preferences for novel situations. What happens in a novel situation if we have encoded our decisions beforehand in the code that automates our weapons?

There's an argument that too much stability is bad, because it will allow for other lesser forms of violence. The [madman theory](https://en.wikipedia.org/wiki/Madman_theory) says we might want to imply that there is some instability, in order to convince the enemy that the weapons could really be used.

Combined human-machine systems can use the benefits of both. Humans can be the moral agency, failsafes, etc. The only problem is the limitations of speed when humans are in the loop or on the loop.

## bans

Bans of certain kinds of weapons are difficult to come by, and depend on factors like the weapon's stability effects, usefulness, and perceived horribleness. This movement toward an automated weapons ban is different because it's led by NGOs, not states. All the states that have signed on so far are small ones without the ability to win an automation arms race. But among those participating in the conversation, there appears to be an early consensus that humans ought to always be involved. But this particular area is hard because it's so difficult to define the set of things that are "automated systems".

Things that make a ban successful:

1. An identifiable focal point
2. Perceived horribleness
3. Transparency: the ability to verify

Types of possible automation bans:

- regulate the type of autonomy: hard because it's all software, hard to judge
  - Maybe just non-recoverable machines can be automated? That way there's a cost to deployment.
- anti-personnel autonomous weapons: low military usefulness, high horror
- non-legally binding code of conduct to establish rules of the road
- establishing a general principle about the role of human judgement in war
  - E.g. stating that a human must be responsible for the IHL rules, meaning that autonomous systems would have to remain limited in scope.

The good news is that human societies already show natural restraint in war. Maybe we'll figure it out.
