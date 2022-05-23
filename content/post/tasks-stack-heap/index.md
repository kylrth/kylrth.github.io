---
title: "keep your tasks in the heap"
date: 2022-03-22T11:23:20-04:00
draft: false
tags: ["productivity"]
---

Often when someone (usually a professor) is sharing their screen I see that their browser has so many tabs open that the descriptions are lost:

{{< zoom-img src="tabs.png" >}}

That was my best impersonation as a Firefox user. Chrome will let you go a lot further (like ~113 tabs) before starting to provide a dropdown to show you the list of open tabs:

{{< zoom-img src="chrome_tabs.png" >}}

Besides the obvious fact that this makes it hard to find a tab you're looking for, you also waste computer memory and add to your cognitive load while you're working.

I don't think I've ever had this many tabs open for real reasons, probably because if I wanted to remember to look at something I would save it to the bookmarks toolbar. In the past few years I've gotten rid of the bookmarks toolbar because I think it can add visual distraction just like tabs, and bookmarks in general became a bit of a [junk drawer](https://www.urbandictionary.com/define.php?term=junk%20drawer) for me.

Right now the top of my browser looks like this:

{{< zoom-img src="firefox.png" >}}

- The two rightmost tabs are related to my current task, which is writing this post. The first is the Hugo draft render of this post, and the second is the link I added above about junk drawers. I'll close both of these by the time I'm done writing.
- The second tab from the left is a [page](https://github.com/WinkoErades/Joplin-note-taking-templates) describing how to use templates in [Joplin](https://joplinapp.org/). It's what I was looking at when the idea came to me to write this post. When I finish writing this post, I'll return to that tab to continue what I was working on there.
- The leftmost tab is my task manager ([Vikunja](https://vikunja.io/)), which holds tasks I don't have on my mind right now, including links to read later.

All this detail is to point out that I process each of these in order, from right to left. When I finish these two current tasks I'll return to my task manager where I'll decide my next task. If a task is not relevant but I'd like to do it later, instead of keeping a tab open I add the link to my task manager.

This distinction between open tabs and the task manager works a lot like [stack and heap memory](https://www.guru99.com/stack-vs-heap.html). Just look at Wikipedia's [diagram](https://en.wikipedia.org/wiki/Stack-based_memory_allocation#/media/File:ProgramCallStack2_en.svg) on the article for stack-based memory allocation, and you'll see what I mean.

When your "stack" of tabs gets too long, it ceases to provide what a stack should provide: fast access to information relevant to *current* tasks. Even if you still process things from right to left, by the time you get to the leftmost items you will have lost the mental context for the task. And you're not likely to be completing tasks in a very good order if you're working through that many items in the reverse order you found them.

A task manager is like a heap because it can store a lot more tasks while keeping track of priority and context. It comes with tools that help you curate it well, so it won't become a junk drawer like browser bookmarks are. This allows my open tabs to function like a true stack, and I can shut my computer down nearly every day.

## false urgency of new tasks

When I work this way, I'm prone to overvalue new tasks and [depth-first search](https://xkcd.com/761/) on things that aren't very urgent. For example, I am taking an hour or so to write this post in the middle of performing a task that will only take about 10 minutes, which I was doing as I was turning some thoughts I had last night into tasks in my task manager, which I wanted to get done before I started working on a class project. 👀

I can think of a few reasons for this behavior:

- wanting to avoid the overhead of adding a new task into the task manager
- feeling that if I don't do it now, I may never do it
- feeling that I may never have the context for this task again

The rational responses to those reasons are:

- This overhead is exaggerated.
- In that case, maybe it's better to never do it. When I see it in the task manager I'll be more rational about whether it's worth doing.
- Add more comments to the task to save the context.

## in summary

- Use a task manager.
- Close all of your tabs right now by either adding them to the task manager or deciding they're not important.
- Process your tabs from right to left, like a [stack](https://www.guru99.com/stack-vs-heap.html).
- [Ask yourself what it's all for.](https://xkcd.com/722/)
- If a task is not worth doing *right now*, put it in the task manager.
- Turn off your computer ever day.
