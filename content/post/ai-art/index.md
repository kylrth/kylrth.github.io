---
title: "the AI art debate"
date: 2023-03-08T12:09:25-05:00
draft: false
tags: ["philosophy", "deep-learning", "art"]
thumbnail: "industrial-art.png"
thumbnail_alt: "image generated with stable diffusion, positive prompt 'artist stands at a conveyor belt in an art factory, quickly painting a piece before moving on to the next blank canvas on the belt' and negative prompt 'blurry, distorted'"
---

On 2022-11-03 a [class action lawsuit](https://githubcopilotlitigation.com/) was announced against GitHub Copilot on the basis of copyright infringement, and now (2023-01-13) there's [one](https://stablediffusionlitigation.com/) for stable diffusion (against StabilityAI and friends). Browsing through r/StableDiffusion, I'm seeing lots of posts like [this](https://libreddit.kylrth.com/r/StableDiffusion/comments/10e13r3/the_lawyers_suing_stable_diffusion_when_you_tell/) making the very memeable point that 5 billion images can't be stored in a 4 GB model. [From the original poster](https://libreddit.kylrth.com/r/StableDiffusion/comments/10e13r3/the_lawyers_suing_stable_diffusion_when_you_tell/j4oeny6/?context=3):{{% sidenote %}}The thumbnail for this post was generated with stable diffusion. See the alt text for details. Yes, I'm not great at this.{{% /sidenote %}}

> every computer science student with even a passing understanding of information theory can debunk this idea, because it completely breaks entropy.

I write this post to point out that this is not true.

Google announced [Project Starline](https://blog.google/technology/research/project-starline/) a while back, which promises to do  mind-bendingly high-quality video calls, using AI to perform the compression. It probably uses Google's [SoundStream](https://ai.googleblog.com/2021/08/soundstream-end-to-end-neural-audio.html), which they've termed a "neural audio codec", for the audio component.

Why can a neural audio codec provide "3.2x-4x" bitrate gains over non-neural codecs?

It's because these models are only encoding a small region of their possible input space. The SoundStream codec is specifically trained to encode speech, music, and environmental sounds. Likewise, I'm confident that whatever they're using for video in Starline is optimized specifically for representing people sitting in a Starline booth.

If we were to train a model on image files with evenly distributed random noise, it would come up against the standard information-theoretical limits. But if our data distribution is substantially restricted (as it is in most ML applications), the model can encode a lot of knowledge about images in a shared representation that's relatively small. There is a ton of structure shared across distributions like "all images taken by a camera", and even more for more restricted distributions like "photos of cats and dogs" or "photos of visual art".{{% sidenote %}}I'm willing to bet that this is also why neural models are sensitive to adversarial perturbations---all you have to do is shift off the manifold somewhat and you've created something unlike anything the model has ever seen, while escaping human detection. What is it about human perception that gets around this?{{% /sidenote %}} We see this idea at work with auto-encoders, whose explicit task is to learn compact representations of data distributions. Learned auto-encoder image compression methods now outperform their classical counterparts.{{% sidenote %}}Cui et al. 2021. "Asymmetric gained deep image compression with continuous rate adaptation". ([CVPR](https://openaccess.thecvf.com/content/CVPR2021/html/Cui_Asymmetric_Gained_Deep_Image_Compression_With_Continuous_Rate_Adaptation_CVPR_2021_paper.html), [arXiv](https://arxiv.org/abs/2003.02012)){{% /sidenote %}} Given all this, it's clear that information theory still allows for large models like DALL-E or Stable Diffusion to contain high-fidelity representations of their training images, even if it's not exact or recoverable.

## interpretability and fair use

Even if 5 billion images in a 4GB model still sounds like too much, I don't think we actually need that point in order to see some problems with this defense. The fact is that we actually don't understand how the neural network operates internally. [stablediffusionfrivolous.com](http://www.stablediffusionfrivolous.com/) claims that "AI image generators make use of on the order of a byte or so per image", but there's no way to empirically determine such a claim. Imagine the scenario where the case gets decided in favor of stable diffusion on the basis of the information theory argument. Then consider these possible futures:

- Researchers discover a way to extract reasonably accurate original training art from the representations a year from now.{{% sidenote %}}There's already work showing that retrieval of images close to original images is possible! Check out [these](replication.png) Stable Diffusion-generated images compared with samples from the training set, and see Somepalli et al. 2022. "Diffusion art or digital forgery? Investigating data replication in diffusion models" ([arXiv](https://arxiv.org/abs/2003.02012)). Obviously there are limitations to this particular work: it uses the training images to search the model for a similar possible outputs, so by definition the resulting images will be similar.{{% /sidenote %}}
- Researchers discover a way to extract original training art 20 years from now.
- We discover that there exists an entangled internal representation of all the training art, but it's impossible to extract original training art from the model.
- Researchers never discover a way to extract original training art, but do find a way to determine to high accuracy whether a particular image was used as a training example.

Are we comfortable deciding the legality of this use of art data without actually understanding the internals of the technology? I think rational people can land on both sides of this question:

- **for legality**
  - We don't yet understand how humans rely on the art they've seen when generating new art, yet we're comfortable allowing humans to create works that are highly derivative.
  - Copyright isn't really a fair system anyway, and only exists out of the artists' need for profit in a capitalist system. We should set art free by allowing more people to participate through these technologies.
- **against legality**
  - These technologies only make it harder for artists to benefit from their works, which is necessary in a capitalist system.
  - On the spectrum from completely derivative to completely novel, these AI systems probably sit somewhere on the less novel side compared to humans. That means these technologies probably offend the spirit of fair use.
