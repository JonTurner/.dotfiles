### Stow
---

The following creates a symlink for .zshrc
```bash
cd .dotfiles
stow -t ~/.config .config
```
old way: `stow zsh`


must symlink `.zshenv`
```bash
ln -s ~/.dotfiles/.config/zsh/.zshenv ~/.zshenv
```

