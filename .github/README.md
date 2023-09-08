# Neovim Config

## Features
- unit testing support
- debug support with dap
- lsp native autocomplete with cmp
- syntax highlighting with tree-sitter
- formatter and linter with null-ls
- database management with dbee

## Requirements
<details close>
<summary>neovim 0.8.0+</summary>

```sh
sudo pacman -S neovim
```

</details>

<details close>
<summary>live-server</summary>

```sh
npm install -g live-server
```

</details>

<details close>
<summary>others</summary>

```sh
sudo pacman -S curl unzip ripgrep
```

</details>

## Install

```sh
git clone git@github.com:HydraVim/HydraVim.git ~/.config/nvim
git clone git@github.com:Diogo-ss/neovim-config.git ~/.config/nvim/lua/user
nvim
```
