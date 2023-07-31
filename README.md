# Personal Dev Setup

-   Based on [LazyVim](https://github.com/LazyVim/LazyVim) (but big credits for https://astronvim.com/).
-   Contains an [installer](./install), which creates a [micromamba][mm] "nvim" environment, containing all tools (zig compiler, npm, python) so that it can be installed on bare bone servers.

## Installation

-   Backup any existing files you want to keep
-   Install [micromamba][mm], potentially with `git`
-   Clone this repo into `~/.config/nvim`
-   Run `./install clean`. If you have problems with us deleting the shown assets of any
    existing nvim installation: quit and back them up
-   Run `./install i`

## Usage

This repo provides an IDE focussed for python, markdown, bash and web development.
If you require more/other tools, modify the tools given in [installer]('./install') and
the plugin and config within this repo, then push to your own repo and install.

[mm]: https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html
