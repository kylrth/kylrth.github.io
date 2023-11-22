---
title: "using Matrix"
date: 2020-02-02T12:34:56-07:00
draft: false
tags: ["self-hosted", "matrix", "security"]
---

Matrix is a *federated*, open source chat system. Federation means that people can message each other across different servers, like in the image below. In that way, it works sort of like email: even though you may use `you@gmail.com` and I might use `me@kylrth.com`, we can still write each other emails.

{{< zoom-img src="federation.png" >}}

In our case, I host the server at matrix.kylrth.com, and you and I can connect to it with various [clients](https://matrix.org/ecosystem/clients/). We can write each other messages, but we can also communicate with people on other Matrix servers.{{% sidenote %}}There are a ton of cool features to Matrix, such as [bridging](https://matrix.org/bridges/), voice and video calls, and encryption. You can read a more extensive beginner's guide to Matrix [here](https://joinmatrix.org/). Also check out the Matrix [website](https://matrix.org).{{% /sidenote %}}

## creating an account

Go to [matrix.kylrth.com/register](https://matrix.kylrth.com/register) to create your account. By using this registration page, you're making an account on my homeserver, matrix.kylrth.com. It's very unlikely the username you want is taken; currently we're at <40 users.{{% sidenote %}}While you can't change your username once created, you can always change your display name.{{% /sidenote %}} To register, you'll need to ask me for a token. When you click "register" something should appear with a link to log in with the Element client.{{% sidenote %}}If nothing happens when you click "register", let me know.{{% /sidenote %}}

## signing in

Once you've successfully registered, sign in from the Element app on your phone or computer.{{% sidenote %}}If you're going to log in on the computer, you might want to download the [desktop version](https://element.io/get-started#download), so that you don't lose your session in the future when you clear cookies in your browser.{{% /sidenote %}} To sign in, use your full username (e.g. `@kyle:kylrth.com`) so that you connect to our server, instead of matrix.org.

Once you've signed in, you need to complete the following two steps:

- **set up a secure key**: There is an option to skip this step, but **you need this in order to not lose encrypted messages if you break your device**. Record the secure key somewhere safe.{{% sidenote %}}ideally in your password manager or on a piece of paper{{% /sidenote %}} If you don't see a prompt to set up cross-signing, you can set it up from the settings page.
- **set up secure backups**: This is done under the "Security & Privacy" tab of the settings page. This safely backs up your encrypted messages on the server.

These two steps are essential if you want to ensure you'll always have access to encrypted chats, even if you break your laptop or get a new phone.

Once you've finished these steps, message `@kyle:kylrth.com` to say hi! Please keep reading to understand how you will sign in to multiple devices.

### encryption and cross-signing

One of the cool parts about Matrix is that you can use *end-to-end encryption* (E2EE) to secure your chats. This means that when you send a message it is encoded so that not even the servers that are carrying your message can read it. Then, when the server gives it to the receiving device, the receiving device can decrypt it because it has the decryption key.

In order for a new device to be able to show old messages, it needs to ask your other devices for the decryption keys. To do this, you will be prompted to *cross-sign* when you first sign in to a new device. If you lose all of your logged in devices at once, you can use your secure key to restore your encrypted messages from the secure backup. This is why it's so important to **always cross-sign and activate Secure Backup when you log into a new device**.{{% sidenote %}}In general, it's a good idea to limit the number of logged-in sessions. You can log out other sessions in settings.{{% /sidenote %}}

### verification (optional)

For extra security, you may want to be 100% sure that the person you're messaging is who you think they are. *Verification* is used to ensure that this real-life person trusts all the devices receiving your messages. To start verification, go to the list of people in a chat room, click on the user, and then click verify. During verification, you and I will be shown a set of emojis, and we need to use an external mode of communication to confirm we're seeing the same ones. Obviously the most secure would be to do it in person, but when that's not possible I often do it through another established mode of communication.

If we both use cross-signing as described above, verification only needs to be performed once between you and each person you chat with. From then on, as long as I cross-sign any new logins, you will continue to see a green shield next to my name, meaning that you can trust that all of these logins are trusted by me. If an unrecognized login is added, the shield will turn red. You can still send messages, but they will be readable from the untrusted devices.
