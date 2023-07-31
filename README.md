# Personal Dev Setup

-   Based on [LazyVim](https://github.com/LazyVim/LazyVim) (but big credits for [AstroNvim](https://astronvim.com/)).
-   Contains an [installer](./install), which creates a [micromamba][mm] "nvim" environment, containing all tools (zig compiler, npm, python) so that it can be installed on bare bone servers.

\=> On your "PET" machines you won't need this, typically. I recommend using Lazyvim or
Astronvim directly.

On bare servers, it might be useful, especially when you do not have root perms:

Since it provides an environment with all tools required for neovim Mason to do it's job and
install all plugins required (plus external tools like lazygit, ripgrep, python3.9 with
pynvim ...).

## Installation

-   Backup any existing files you want to keep
-   Install [micromamba][mm], potentially with `git` and `python` (required for the
    to clone and run installer)
-   Clone this repo into `~/.config/nvim`
-   Run `./install clean`. If you have problems with us deleting the shown assets of any
    existing nvim installation: quit and back them up
-   Run `./install i`

The installer will create

-   The ~/micromamba/envs/nvim environment
-   Symlinks to the installed exectuables (incl. `vi`) into `~/.local/bin`, which should be in your
    `$PATH`

`./install clean` will remove everything again.

ℹ️ The installer will not install any [NerdFont](https://www.nerdfonts.com/) - that's on you.

## Usage

This repo provides an IDE focussed for python, markdown, bash and web development.
If you require more/other tools, modify the tools given in [installer](./install) and the plugin and config within this repo, then push to your own repo and install.

[mm]: https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html
