# Skgeek
## About
A simple theme for the ZSH shell.
![](preview.png)

It shows you:
-   Your user and host names.
-   Your current directory.
-   If inside a Git repository, the branch and if there are changes to be
    commited.
-   The exit code of failed commands.

## Installation
### Dependencies
-   git
-   A Nerd Font's font.

### Procedures
-   Clone this repository.
```bash
git\
  clone --depth=1 https://github.com/skippyr/skgeek\
  ~/.local/share/zsh/themes/skgeek
```

-   Add the following source rule to your `~/.zshrc` file. Ensure to not source
    other theme.

```bash
source ~/.local/share/zsh/themes/skgeek/skgeek.zsh-theme
```

-   Reopen ZSH.

## Copyright
This software is under the MIT license. A copy of the license is bundled with
the source code.

