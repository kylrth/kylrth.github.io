---
title: "Removing a keyword from git history"
date: 2020-12-02T11:34:25-07:00
draft: false
tags: ["programming"]
---

I recently had to remove a keyword from the git history of a project I was working on. This meant not just [removing a file](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/removing-sensitive-data-from-a-repository#using-filter-branch) but modifying commits where the keyword was added, commits where the keyword was removed, and even commits with the keyword in the commit message. I eventually came to the right solution through a mix of blog posts and the documentation for [`git rebase`](https://git-scm.com/docs/git-rebase/).

For this example, assume the keyword is "matrix". The example output shown is from the git repo for this website.

1. Use `git log -S'matrix' -i --pretty=oneline` (see docs for [`-S`](https://www.git-scm.com/docs/git-log#Documentation/git-log.txt--Sltstringgt) and [-i](https://www.git-scm.com/docs/git-log#Documentation/git-log.txt--i)) to see the list of commits that add or remove the string "matrix" (ignoring case).

    ```txt
    kyle@leibniz: kylrth.com$ git log -S'matrix' -i --pretty=oneline
    f46eb229ea3c4ba3324338711e75cfb75e9cb64f add Matrix social icon
    c64bb4bb358af98a05baa9b10b7de7abdcca890f update homepage, add posts, revamp theme
    1c5c71aeb429f6bb62c0a6b081b05fea3ca1a0bd start from pickles theme
    e275af820acb771b10ec2cb08c7e283da334af6d chore: import old site to Hugo
    ```

1. Use `git log --grep=matrix -i --notes --pretty=oneline` (see docs for [`--grep`](https://www.git-scm.com/docs/git-log#Documentation/git-log.txt---grepltpatterngt) and [`--notes`](https://www.git-scm.com/docs/git-log#Documentation/git-log.txt---notesltrefgt)) to see the list of commits whose messages (or notes) contain the string "matrix" (ignoring case).

    ```txt
    kyle@leibniz: kylrth.com$ git log --grep=matrix -i --notes --pretty=oneline
    f46eb229ea3c4ba3324338711e75cfb75e9cb64f add Matrix social icon
    ```

1. Now determine which of the listed commits is the oldest between the two last commits listed by each command. In my example it's easy to see that it's `e275af8`, but if it's not clear to you use `git merge-base --is-ancestor ${oneHash} ${otherHash} && echo yes || echo no` to determine if `${oneHash}` is an ancestor of `${otherHash}`.
1. Begin the interactive rebase by running the following rebase command, replacing `e275af8` with the oldest commit as determined in the previous step. Be sure to include the `^` so that the rebase begins from the commit *before* your target commit.

    ```bash
    git rebase -i e275af8^ \
        --exec 'grep -qri matrix . ; if [ $? -ne 1 ]; then exit 1; fi' \
        --exec 'git log --notes | grep -qi matrix ; if [ $? -ne 1 ]; then exit 1; fi'
    ```

    (See docs for [`--exec`](https://www.git-scm.com/docs/git-rebase#Documentation/git-rebase.txt---execltcmdgt).) The first `--exec` command runs after each modified commit, and interrupts the rebase if you accidentally commit the keyword. The second `--exec` command interrupts the rebase if you accidentally leave the keyword in a commit message or note.

Now you can be sure no instances of the keyword will be missed in your rebase.
