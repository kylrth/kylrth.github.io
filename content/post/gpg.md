---
title: "using GPG to prove you wrote your code"
date: 2021-04-12T07:13:54-06:00
draft: false
tags: ["security", "programming"]
---

GPG is cool. You can use GPG to send encrypted messages, sign files to prove you generated them, and sign git commits to prove you committed them. You can get my key [here](/gpg.pub). DigitalOcean has a [neat guide](https://www.digitalocean.com/community/tutorials/how-to-use-gpg-to-encrypt-and-sign-messages) to getting started with GPG. It explains asymmetric encryption, key generation and revocation, and key signing and maintenance.

Git commit authorship can be modified by anyone, as demonstrated by [this tool](https://github.com/jayphelps/git-blame-someone-else). But by uploading your GPG public key to GitHub, you allow anyone who trusts GitHub to be sure that commits marked "verified" were actually created by you.

First, upload your GPG public key to GitHub through the Settings page. Then, tell git about your signing key by following the instructions [here](https://docs.github.com/en/github/authenticating-to-github/telling-git-about-your-signing-key).

From now on, add `-S` to your `git commit` invocation, and `-s` to your `git tag` invocation. Add `"git.enableCommitSigning": true,` to your VS Code `settings.json` so that VS Code signs commits for you. You can even [forward your GPG keys to remote SSH sessions](https://wiki.gnupg.org/AgentForwarding).
