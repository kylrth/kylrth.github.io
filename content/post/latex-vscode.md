---
title: "I really just want to edit and compile my LaTeX files in VS Code"
date: 2021-07-12T21:43:47-06:00
draft: false
tags: ["programming"]
---

LaTeX has a ton of different flavors, releases, and installations: [MacTeX](https://en.wikipedia.org/wiki/MacTeX), [MiKTeX](https://en.wikipedia.org/wiki/MiKTeX), [TeXworks](https://en.wikipedia.org/wiki/TeXworks), [XeTeX](https://en.wikipedia.org/wiki/XeTeX), [pdfTeX](https://en.wikipedia.org/wiki/PdfTeX), [LuaTeX](https://en.wikipedia.org/wiki/LuaTeX)... If you're using Linux and just want to edit LaTeX files in Visual Studio Code and have them automatically rendered as PDFs, follow these instructions:

1. On Arch-based distros, install the packages listed [here](https://wiki.archlinux.org/title/TeX_Live). On Debian-based systems, `sudo apt install texlive`.
1. Install some Perl dependencies:

    ```bash
    sudo cpan Log::Log4perl Log::LogDispatch Log::Dispatch::File YAML::Tiny File::HomeDir
    ```

1. If you want to use FontAwesome on Arch-based systems, install the `oft-font-awesome` package and then do the following ([source](https://wiki.archlinux.org/title/TeX_Live#Making_fonts_available_to_Fontconfig)):

    ```bash
    sudo ln -s /usr/share/fontconfig/conf.avail/09-texlive-fonts.conf /etc/fonts/conf.d/09-texlive-fonts.conf
    fc-cache && mkfontscale && mkfontdir
    ```

    On Debian-based systems, install the font package with apt:

    ```bash
    sudo apt install texlive-fonts-recommended texlive-fonts-extra
    ```

1. Install the VS Code extension called "LaTeX Workshop".
1. If you want to use the fontspec package and get an error saying that "the fontspec package requires either XeTeX or LuaTex", add the magic command `% !TEX program = xelatex` to the top of your .tex file.
1. If your installation needed to add some paths to your PATH but VS Code isn't seeing them, try opening VS Code from the shell (with `code path/to/workspace`) so that it inherits `$PATH` from the interactive shell. (There might be a way to change the bin path in the settings for LaTeX Workshop, but I haven't needed to find that setting yet.)
