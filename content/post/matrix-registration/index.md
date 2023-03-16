---
title: "using Matrix"
date: 2020-02-02T12:34:56-07:00
draft: false
tags: ["self-hosted", "matrix", "security"]
---

Matrix is a *federated*, open source chat system. By federated, we mean that people can communicate across different servers, like in the image below. In that way, it works sort of like email: even though you may use `you@gmail.com` and I might use `me@kylrth.com`, we can still write each other emails.

{{< zoom-img src="federation.png" >}}

In our case, I host the server at matrix.kylrth.com, and you and I can connect to it with various [clients](https://matrix.org/clients-matrix/). We can write each other messages, but we can also communicate with people on other Matrix servers. There are a ton of cool features to Matrix, such as [bridging](https://matrix.org/bridges/), voice and video calls, and encryption.{{% sidenote %}}You can read a more extensive beginner's guide to Matrix [here](https://joinmatrix.org/). Also check out the Matrix [website](https://matrix.org).{{% /sidenote %}}

## creating an account

Go to [matrix.kylrth.com/register](https://matrix.kylrth.com/register) to create your account. By using this registration page, you're making an account on my homeserver, matrix.kylrth.com. Feel free to use your own name as the username, because it's highly unlikely someone has already used it. (Currently we're at <30 users.) Also, remember that you can always change your display name, which is separate from your username. To register, you'll need to ask me for a token. When you click "register" something should appear with a link to log in with the Element client.{{% sidenote %}}If nothing happens when you click "register", let me know because that's an error I need to fix.{{% /sidenote %}}

## signing in

Once you've successfully registered, sign in from the Element app on your phone or computer.{{% sidenote %}}If you're going to log in on the computer, it'll be better to download the [desktop version](https://element.io/get-started#download), so that you don't lose your session in the future when you clear cookies in your browser.{{% /sidenote %}} To sign in, use your full username (e.g. `@kyle:kylrth.com`) so that you connect to our server, instead of matrix.org.

Once you've signed in, you need to complete the following two steps:

- **set up a secure key**: There is an option to skip this step, but you need this in order to use encryption safely. Record the secure key somewhere.{{% sidenote %}}ideally in your password manager, alongside your account password{{% /sidenote %}} If you don't see a prompt to set up cross-signing, you can set it up from the settings page.
- **set up secure backups**: This is done under the "Security & Privacy" tab of the settings page. This safely backs up your encrypted messages on the server.

These two steps are essential if you want to ensure you'll always have access to encrypted chats, even if you break your laptop or get a new phone.

Once you've finished these steps, message `@kyle:kylrth.com` to say hi! Please keep reading to understand how you will sign in to multiple devices.

### encryption and cross-signing

One of the cool parts about Matrix is that you can use *end-to-end encryption* (E2EE) to secure your chats. This means that when you send a message it is encoded so that not even the servers that are carrying your message can read it. Then, when the server gives it to the receiving device, the receiving device can decrypt it because it has the decryption key.

**In order to not lose access to your encrypted messages** when you reset your device or change your phone, every time you sign in you need to:

- cross-sign from an existing device (this is 2-factor authentication, which is what happens when your bank texts you a code finish logging in),
- activate secure backup, and
- restore from that backup.

Otherwise, old messages will appear but won't be decrypted. But not to worry: even if you lose all of your logged in devices at once, as long as you still have your username, password, and secure key, you will be able to restore your encrypted messages from the secure backup.

In general it's important to limit the number of logged-in sessions. You can log out other sessions within Element. If you ever lose all logged-in devices, you can enter your secure key to recover decryption keys for old messages and start cross-signing new devices again.

### verification

For extra security, you may want to know that the person you're messaging is the one you think they are. This is where *verification* comes in. Verification is used to ensure that you trust the devices that messages are being sent to. You want to be sure that my laptop and phone are the devices you think they are. So, before sending me any encrypted messages, you and I perform verification. If we both use cross-signing, verification only needs to be performed once between you and each person you chat with. From then on, as long as I cross-sign any new logins, you will continue to see a green shield next to my name, meaning that you can trust that all of these logins are trusted by me. If an unrecognized login is added, the shield will turn red. You can still send messages, but they will be readable from the untrusted devices unless you have explicitly disallowed this in settings.

Verification is done by going to the list of people in a chat room, clicking on the user, and then choosing to verify. During verification, you and I will be shown a set of emojis, and we need to use an external mode of communication to confirm we're seeing the same ones. Obviously the most secure would be to do it in person, but when that's not possible I usually do it through some other established mode of communication.
