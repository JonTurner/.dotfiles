# Stow

The following creates a symlink for ~/.config
```bash
cd .dotfiles
stow -t ~/.config .config
```


must symlink `.zshenv` to ensure zsh can find configs in `~/.config/zsh`
```bash
ln -s ~/.dotfiles/.config/zsh/.zshenv ~/.zshenv
```

# terminal
install `iterm2`
### iterm2 color scheme
`https://iterm2colorschemes.com/`
<C-i> click colors tab.  Import `~/.dotfiles/gruvbox.itermcolors` and then select gruvbox in dropdown

### Oh My Zsh
install https://github.com/ohmyzsh/ohmyzsh

- https://github.com/romkatv/powerlevel10k - install and configure
- https://github.com/zsh-users/zsh-syntax-highlighting
- https://github.com/zsh-users/zsh-autosuggestions
- https://github.com/athityakumar/colorls

