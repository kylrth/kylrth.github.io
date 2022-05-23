# [kylrth.com](https://kylrth.com)

This is the source for my personal website. I keep the repo public because I think it's valuable to be [working in the open](https://duckduckgo.com/?q=working+in+the+open) whenever possible.

I started this website from the [Pickles theme](https://github.com/mismith0227/hugo_theme_pickles/), which I've copied and modified as needed. It's published with an MIT license, which is preserved [here](layouts/LICENSE). The rest of this repository (including the content) is licensed with [CC0](https://creativecommons.org/share-your-work/public-domain/cc0/), which means you're free to use it how you like.

## building

The command I use to generate the static files for hosting is the following:

```sh
HUGOxPARAMSxGITxLAST_COMMITxHASH=$(git log -1 --format=%H) hugo --gc --minify
```

The environment variable enables the source code links in the footer. It's inspired from [this](https://github.com/gohugoio/hugo/issues/9738#issuecomment-1086669372).
