# Configs

Here are some configs for my editors, programs, etc.

This is intended to be use for fast setup for both vim and neovim.

For complete setup for neovim please check other repo.

To create `init.vim` for applying this setting to nvim:

```bash
mkdir -p ~/.config/nvim/
echo '
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
' > ~/.config/nvim/init.vim
```
