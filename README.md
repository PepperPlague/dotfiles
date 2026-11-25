# dotfiles

> These are my dotfiles. There are many dotfile repos, but this one is mine.  
> My dotfiles are my best friend. They are my life. I must master what
> they config as I must master my life.  
> Without me, my dotfiles are useless. Without my dotfiles, I am useless.
>
> -- The Linux User's Creed

These config files I use in my environment and the various shell scripts
I have in my `$PATH`. *You know... dotfiles*.

**Obligatory Warning**  
You should first fork this repository, review the code, and remove
things you don't want or need. Don't blindly use my settings unless you
know what that entails. *Here be dragons!*

---

## Overview
Here's a high level overview if you just want to see what I use:

* **OS**: [macOS Golden Gate](https://www.apple.com/macos/) 
* **Browser**: [Safari](https://www.apple.com/safari/)
  * [StopTheMadness Pro](https://apps.apple.com/app/stopthemadness-pro/id6471380298)
  * [uBlock Origin Lite](https://apps.apple.com/us/app/ublock-origin-lite/id6745342698)
  * [Hush](https://oblador.github.io/hush/)
* **Terminal**: [Ghostty](https://ghostty.org)
* **Shell**: [zsh](https://www.zsh.org) + [Starship](https://starship.rs)   
	* **Shell Theme**: [Dracula](https://draculatheme.com)
	* **Shell Font**: [Ioskeley Mono](https://github.com/ahatem/IoskeleyMono)
* **Editor**: [Helix](https://helix-editor.com)                          
* **IDE**: [Sublime Text](https://www.sublimetext.com)

## Installation / Managing
Installation and day-to-day management requires only git as a dependency. No
other tools or symlinking are required:

```console
$ cd ~
$ git clone --no-checkout --depth=1 https://github.com/PepperPlague/dotfilesh.git .
$ git reset --hard
```

**WARNING**: The above will clobber any existing dotfiles in your $HOME. You may want to run `git status` 
before running `git reset --hard`. Or you can use `deploy.sh`, which will sanely warn before clobbering.

## Author
Copyright 2016 - 2026 PepperPlague, except where otherwise noted.

Licensed under the ISC license.

*This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.*
