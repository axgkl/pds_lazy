# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.


## pds

### Gotchas

- We add the micromamba venv PATH last, at startup of vi (~/.local/bin/vi), so that we use
  the project's venvs, e.g. for Python.
  
=> Try installing new stuff from mason (e.g. LspInstall) with activated nvim micromamba
  environ! Otherise it will try install node modules in your activated env
