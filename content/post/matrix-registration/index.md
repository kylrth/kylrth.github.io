---
title: "using Matrix"
date: 2020-02-02T12:34:56-07:00
draft: false
tags: ["self-hosted", "matrix", "security"]
---

Matrix is a *federated*, open source chat system. By federated, we mean that people can communicate across different servers, like in the image below. In that way, it works sort of like email: even though you may use `you@gmail.com` and I might use `me@kylrth.com`, we can still write each other emails.

{{< zoom-img src="federation.png" >}}

In our case, I host the server at matrix.kylrth.com, and you and I can connect to it with various [clients](https://matrix.org/clients-matrix/). We can write each other messages, but we can also communicate with people on other Matrix servers. There are a ton of cool features to Matrix, such as [bridging](https://matrix.org/bridges/), voice and video calls (still not supported by my server), and encryption.{{% sidenote %}}You can read a more extensive beginner's guide to Matrix [here](https://joinmatrix.org/). Also check out the Matrix [website](https://matrix.org).{{% /sidenote %}}

## creating an account

Go to [matrix.kylrth.com/register](https://matrix.kylrth.com/register) to create your account. By using this registration page, you're making an account on my homeserver, matrix.kylrth.com. Feel free to use your own name as the username, because it's highly unlikely someone has already used it. (Currently we're at <30 users.) Also, remember that you can always change your display name, which is separate from your username. To register, you'll need to ask me for a token. When you click "register" something should appear with a link to log in with the Element client.{{% sidenote %}}If nothing happens when you click "register", let me know because that's an error I need to fix.{{% /sidenote %}}

## signing in

Once you've successfully registered, sign in from the Element app on your phone or computer.{{% sidenote %}}If you're going to log in on the computer, it'll be better to download the [desktop version](https://element.io/get-started#download), so that in the future you don't lose your session when you clear cookies in your browser.{{% /sidenote %}} To sign in, you'll need to change the homeserver URL from matrix.org to **<https://matrix.kylrth.com>**.{{% sidenote %}}On mobile this is found under "advanced server options".{{% /sidenote %}} Otherwise, it won't know who you are because you don't have an account on matrix.org. **Be sure to include the https://.**

Once you've signed in, you need to complete the following two steps:

- **set up a recovery passphrase**: There is an option to skip this step, but we want you to use cross-signing, so please do set it up and record the recovery passphrase somewhere. (This will make sense when you read the section on cross-signing.) If you don't see a prompt to set up cross-signing, you can set it up from the settings page.
- **set up encryption backups**: This is done under the "Security & Privacy" tab of the settings page. This is important if you want to be able to see old messages when you log in from a new device.

Once you've done both of these things, message `@kyle:kylrth.com` to say hi! Please keep reading to understand how you will sign in to multiple devices.

### encryption, cross-signing, and verification

One of the cool parts about Matrix is that you can use *end-to-end encryption* (E2EE) to secure your chats. This means that when you send a message it is encoded so that not even the servers that are carrying your message can read it. Then, when the server gives it to the receiving device, the receiving device can decrypt it because it has the decryption key.

When someone sends a message in an encrypted room, the keys to decrypt that message are shared with all the logins **currently in the room**. That includes both my phone and my laptop, for example. If I log in with a new session, it will invite me to *cross-sign* by approving the login with one of my other logged-in devices. Cross-signing allows my new device to ask my old devices for the keys to see old messages, or get them from the backup that we set up earlier.

In general it's important to limit the number of logged-in sessions. You can log out other sessions within Element. Any time you log in with a new session, make sure to cross-verify from your phone or other device so that other people know to trust your new device. If you ever lose all logged-in devices, you can enter your recovery passphrase to recover old decryption keys and start cross-signing new devices again.

Before, I said that whenever someone sends a message the decryption keys are sent to all logins **currently in the room**. This means that as soon as my new device is logged in, people sending messages will send decryption keys to the new session (regardless of whether I've cross-signed the new session). This is where *verification* comes in. Verification is used to ensure that you trust the devices that messages are being sent to. You want to be sure that my laptop and phone are the devices you think they are. So, before sending me any encrypted messages, you and I perform verification. If we both use cross-signing, verification only needs to be performed once between you and each person you chat with. From then on, as long as I cross-sign my new logins you will continue to see a green shield next to my name, meaning that you trust all of the devices I'm using. You can still send messages without the green shield and they will be readable from the untrusted devices, but it's a little less safe because it means that my old devices don't yet trust my new ones. 👀

Verification is done by going to the list of people in a chat room, clicking on the user, and then choosing to verify. During verification, you and I will be shown a set of emojis, and we need to use an external mode of communication to confirm we're seeing the same ones. Obviously the most secure would be to do it in person, but when that's not possible I usually do it through some other established mode of communication.
