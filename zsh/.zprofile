# source /usr/share/doc/fzf/examples/key-bindings.zsh
# source /usr/share/doc/fzf/examples/completion.zsh

VIM="nvim"
export GOPATH=$HOME/go
export GIT_EDITOR=$VIM
export DOTFILES=$HOME/.dotfiles
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

catr() {
    tail -n "+$1" $3 | head -n "$(($2 - $1 + 1))"
}

validateYaml() {
    python -c 'import yaml,sys;yaml.safe_load(sys.stdin)' < $1
}

# Local config
[[ -f ~/.zprofile.local ]] && source ~/.zprofile.local
