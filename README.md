# Pre-requisites

- Neovim 0.11
- Nerd Font as your terminal font. *Mono fonts would work but icons will slightly look smaller*
- Ripgrep is required for grep searching with Telescope (OPTIONAL)
- GCC
- Make
- Delete old neovim folders

# Features

- Go Programming Language support
- Dockerfile support
- Kubernetes manifests support
- Kustomization files support
- GitHub Actions and Workdlows support
- GitLab CI support

# Install 

Linux/MacOS

```bash
git clone https://github.com/netrunner10/nvchad-config.git ~/.config/nvim && nvim
```

- Run `:MasonInstallAll ` command after lazy.nvim finishes downloading plugins
- Delete the `.git ` folder from nvim folder
- Learn customization of ui & base46 from `:h nvui`

# Uninstall

Linux/MacOS

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

**This repo is supposed to be used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!

