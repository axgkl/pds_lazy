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

### No Micromamba

-   `./install mm` (and confirm the defaults. Will install micromamba with git and python if not present)
-   `source .bashrc` (or re-enter your shell)
-   `./install all`  (will backup any existing nvim files, then clones this repo if not present and runs the python installer)

Requires: curl and bzip2.

### Micromamba and python already present

Assumption: This repo already in `~/.config/nvim`. If not: run `./install all`

-   Backup any existing files you want to keep
-   Run `./install.py clean`. If you have problems with us deleting the shown assets of any
    existing nvim installation: quit and back them up
-   Run `./install.py i`

The installer will create

-   The ~/micromamba/envs/nvim environment
-   Symlinks to the installed exectuables (incl. `vi`) into `~/.local/bin`, which should be in your
    `$PATH`

`./install clean` will remove everything again.

ℹ️ The installer will not install any [NerdFont](https://www.nerdfonts.com/) - that's on you.

## Usage

This repo provides an IDE focussed for python, markdown, bash and web development.
If you require more/other tools, modify the tools given in [installer](./install.py) and the plugin and config within this repo, then push to your own repo and install.

[mm]: https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html
