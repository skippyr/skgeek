# Skgeek

## Description

A simple dual-line theme for the ZSH shell.

![](images/preview.png)

Here is a description of its design:
-	Your host and user names will appear concatenated with an `@`.
-	Sourced virtual environments will appear with a Python icon preceded by
	`using`.
-	Your current directory will appear preceded by `in`.
-	If inside a Git repository. The current branch will appear preceded by `on`.
	If there are changes to be commited an `*` symbol will appear inside
	parenthesis next to the branch name.
-	If your last command failed, its exit code will appear preceded by `status`.

## Installation

### Dependencies

The following dependencies must be installed to run this software:

| Dependency | Description |
|-|-|
| `git` | Required to retrive information about Git repositories. |

### Manual Procedures

Use the following instructions to install this theme manually.

-	Run the following command inside of a terminal emulator to install the theme.
```bash
git clone --depth=1 https://github.com/skippyr/skgeek\
                    ~/.local/share/zsh/themes/skgeek &&
echo "source ~/.local/share/zsh/themes/skgeek/skgeek.zsh-theme" >> ~/.zshrc
```

-	Reopen the terminal emulator to load the theme.

### Procedures With OhMyZSH

Use the following instructions to install this theme for OhMyZSH.

-	Run the following command inside of a terminal emulator to install the theme.

```bash
git clone --depth=1 https://github.com/skippyr/skgeek\
                    ${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/themes/skgeek
```

-	Change the value of the `ZSH_THEME` variable in your ZSH configuration file,
	`~/.zshrc`, to use the theme:

```bash
ZSH_THEME=skgeek/skgeek
```

-	Reopen your terminal emulator to load the theme.

## Support

Report issues, questions and suggestion through the [issues tab](https://github.com/skippyr/skgeek/issues).

## Copyright

This software is distributed under the MIT License. A copy of the license is
bundled with the source code.

Copyright (c) 2023, Sherman Rofeman. MIT license.

