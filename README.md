# dotfiles

My dotfiles. Mostly for Neovim and Kitty.

What is nice about this is that I use a Lua-only config for Neovim. So far my setup is very minimal so I think it makes for a great starting point.

## Screenshots

![Screenshot of Neovim with LSP](ss.png "Screenshot")

## Installing

Place these in ~/.config

I use [Packer](https://github.com/wbthomason/packer.nvim) for Neovim plugins so make sure to install that first.

To install plugins just start Neovim and run `:PackerSync`

## What is included in Neovim

1. NvimTree - nice tree file structure
2. Treesitter - syntax highlighting
3. LSP (Dart, Flutter, Lua, C#)
4. nvim-dap
