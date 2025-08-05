# terminal
install `iterm2`

### iterm2 color scheme
`https://iterm2colorschemes.com/`
<C-i> click colors tab.  Import `~/.dotfiles/gruvbox.itermcolors` and then select gruvbox in dropdown

#Nerd Font (for powerlevel10k plugin)
`https://github.com/ryanoasis/nerd-fonts?tab=readme-ov-file#option-2-homebrew-fonts`
```bash
brew install font-hack-nerd-font
```

### Oh My Zsh
install instructions: `https://ohmyz.sh/`
install https://github.com/ohmyzsh/ohmyzsh

basic idea: follow steps for oh-my-zsh (not HomeBrew).  ie: clone the plugin's repo and configure in `.zshrc`
```bash
plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
)
```

- https://github.com/romkatv/powerlevel10k - install and configure
- https://github.com/zsh-users/zsh-syntax-highlighting
- https://github.com/zsh-users/zsh-autosuggestions
- https://github.com/athityakumar/colorls


# HomeBrew
install HomeBrew: `https://brew.sh/`

# Stow

The following creates a symlink for ~/.config
Run after adding new files to .config
```bash
brew install stow
cd .dotfiles
stow -t ~/.config .config
```

must symlink `.zshenv` to ensure zsh can find configs in `~/.config/zsh`
```bash
ln -s ~/.dotfiles/.config/zsh/.zshenv ~/.zshenv
```


# Global Gitignore
```bash
git config --global core.excludesfile ~/.config/git/ignore
```
confirm setting
```bash
git config --global core.excludesFile
```


# Dygma Raise 2 config
### iTerm2

Set up some keybindings
- Open iTerm2 Preferences (⌘ + ,).
- Go to the Profiles tab.
- Select your profile and click the Keys sub-tab.
- Click the + button to add a new key binding.

`Option + Left Arrow` -> `Send Escape Sequence` = `b`
`Option + Right Arrow` -> `Send Escape Sequence` = `f`
`Option + Backspace` -> `Send Hex Code` = `0x1b 0x08`
`Option + Delete` -> `Send Hex Code` = `0x1b 0x64`


### Open/Launch layer
##### Shortcuts.app for the open layer
- open shortcuts app
- Action -> `Open App`
- Select app to Open
- Set up shortcut

HyperKey == shift + ctrl + command + option
- Chrome -> HyperKey + C
- Firefox -> HyperKey + F
- Reflect -> HyperKey + R
- Linear -> HyperKey + L
- Notion -> HyperKey + N
- Slack -> HyperKey + S
- Zoom -> HyperKey + Z

iTerm2 -> Option + space  (this is a default config in iTerm2 - nothing to do here)


