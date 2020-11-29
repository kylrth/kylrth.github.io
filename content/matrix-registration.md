---
title: "Matrix Registration"
date: 2020-02-02T00:00:00-00:00
draft: false
---

{{< zoom-img src="/images/matrix-registration/federation.png" >}}

Matrix is a *federated*, open source chat system. By federated, we mean that people can communicate across different servers, like in the image on the right. In that way, it works sort of like email: even though you may use `you@gmail.com` and I might use `me@kylrth.com`, we can still write each other emails.

In our case, I host the server at matrix.kylrth.com, and you and I can connect to it with various [clients](https://matrix.org/clients-matrix/). We can write each other messages, but we can also communicate with people on other Matrix servers. There are a ton of cool features to Matrix, such as [bridging](https://matrix.org/bridges/), voice and video calls (still not supported by my server), and encryption. You can read more on the Matrix [website](https://matrix.org).

## getting started

Go to [chat.kylrth.com/register](https://chat.kylrth.com/register) to create your account. By using this registration page, you're making an account on my homeserver, matrix.kylrth.com. Feel free to use your own name as the username, because it's highly unlikely someone has already used it. (Currently we're at ~30 users.) Also, remember that you can always change your display name, which is separate from your username. To register, you'll need to ask me for a token. Once you've successfully registered, log in from your phone or computer. (If you're going to log in on the computer, it'll be easier to download the [desktop version](https://element.io/get-started), so that in the future you don't lose your session when you clear cookies.)

To sign in, you'll need to change the homeserver URL from matrix.org to matrix.kylrth.com. (Otherwise, it won't know who you are because you don't have an account on matrix.org.) On Android this is found under "advanced server options". Once you've signed in, the first thing it'll do is ask you to set up a recovery passphrase. There is an option to skip this step, but we want you to use cross-signing, so please do set it up. (This will make sense when you read the section on cross-signing.)

**If you don't see a prompt to set up cross-signing**, don't worry. You can set it up from somewhere in settings.

Once you've set up cross-signing, send me a message `@kyle:kylrth.com`. Please keep reading to understand how you will sign in to multiple devices.

## cross-signing

One of the cool parts about Matrix is that you can use end-to-end encryption to secure your chats. This means that when you send your message it is encoded so that not even my server can read your message. Then, when the server sends it to the receiving device, the receiving device can decrypt it.

Using encryption this way requires us to perform an extra step, called verification. Verification is used to ensure that you trust the devices that messages are being sent to. For example, if you send me a message, the message will show up on my laptop as well as my phone. You want to be sure that my laptop and phone are the devices you think they are. So, before sending me any encrypted messages, you and I perform verification. This can be done by going to the list of people in a chat room, clicking on me, and then choosing to verify. During verification, you and I will be shown a set of emojis, and we need to use an external mode of communication to confirm they're the same. Obviously the most secure would be to do it in person, but I usually do it over Facebook Messenger or by text. Verification only needs to be performed once between you and each person you chat with.

In order for all of our devices to trust each other, it's best to use cross-signing. Cross-signing means that you perform verification *with yourself* when you log in to a new device. So if you set up your account on desktop and now you want to sign in on an iPhone, when you sign in you'll be prompted to verify from your desktop login. This is sort of like 2-factor authentication, if you've ever done that. **Cross-signing means that all of my devices will automatically trust your new device, even though I haven't verified with that device.** If you ever lose your other logged-in devices, you can enter your recovery passphrase to achieve the same result.

In general it's important to limit the number of logged-in sessions. You can log out other sessions within Element. Any time you log in with a new session, make sure to cross-verify from your phone or other device so that other people know to trust your new device.
