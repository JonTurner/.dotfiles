# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH=~/.npm:"$PATH"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Where should I put you?
bindkey -s ^f "tmux-sessionizer\n"

export PATH=~/.local/.npm-global/bin:"$PATH"
export PATH=~/.local/bin:"$PATH"

alias rg="rg --smart-case --heading --line-number --color=always --hidden"
alias tat="tmux attach -t "
alias vim="nvim"


# -----------------------------------------------------------
# JT customizations
export PATH="/Users/jon.turner/maven/apache-maven-3.8.6/bin:$PATH"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-18.0.2.1.jdk/Contents/Home"

alias grep='grep --colour'
alias be='bundle exec'
alias gstv='vim -O $(git status -s | awk '"'"'{print $2}'"'"')'
alias gc='git commit -v'
alias gst='git status'
alias gdc='git diff --cached'
alias gap='git add -p'
alias ll='ls -lah'

alias glog="git log --name-status"
alias gss="git status -s"

alias grh='git reset HEAD~'
alias gcm='git aa; gc -m '
# alias resque="bundle exec rake resque:work"
alias cp="cp -v"
alias mv="mv -v"
alias git_lc='git ls-files | xargs wc -l'
# alias start_screensave='open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app'
# alias rgl='rvm gemset list'
alias gd="git diff"
alias gdw='gd --word-diff'
alias gdcw='gdc --word-diff'
alias gco='git checkout'
alias gp='git push'
alias gpr='git pull --rebase'
alias gb='git branch'
alias gg='git grep'
alias grc='git rebase --continue'
# https://stackoverflow.com/questions/3446320/in-vim-how-to-map-save-to-ctrl-s
# basically for most terminals ctrl+s is already used for something, so this alias vim so that before we run vim we turn off that mapping.
alias nvim="stty stop '' -ixoff; nvim"

#delete merged branches
alias gprune="git branch --merged | grep -v '\*' | xargs -n 1 git branch -d"
alias gpt="git push origin --tags"



most-used-commands(){
  # Ben Orenstein - find most used commands
  # presents opportunities to create better shortcuts
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

gs () {
  <<"DESCRIPTION" # cat <<"DESCRIPTION" >/dev/null
    - list filenames from git status
    - searchable by passing a regex
    - useful as input:
      $> vim -O $(gs)
      $> vim -O $(gs controller)
      $> cucumber $(gs feature)
      $> git add $(gs migrat)
DESCRIPTION
  git status --porcelain | sed 's/^...//;s/.*> //' | grep "$1" | sort -u
}

_man ()
{
  <<-"META"
  AUTHOR: Joshua Toyota
  Date: 2011-12-15 12:35pm
  Description:
    If you open the manual for a bash builtin command, it takes you to the
  useless builtin(1) manpage.  If this happens, open the bash(1) manpage, and
  jump to the command you were searching for.

  Example:
    $> _man jobs
    This will open $(man bash) and jump to the description of jobs.
META

    if ( man $1 | grep '^BUILTIN' ); then
        man bash | col -b | sed -n '/^SHELL BUILTIN/,$p' | less +/^[[:space:]]*$1;
    else
        man $1;
    fi
}
function ggl ()
{
  git grep -l "$1" -- './*' ':!./doc/*' ':!./app/assets/javascripts/admin/mediaelement/*' ':!./app/assets/javascripts/*.compiled.js' ':!./app/assets/javascripts/i18n/*' ':!/app/assets/javascripts/site/1.0.0/libs/*' ':!./app/assets/javascripts/admin/plugins/*'
}
function ggv()
{
  vim -O `git grep --name-only "$1" -- './*' ':!./doc/*' ':!./app/assets/javascripts/admin/mediaelement/*' ':!./app/assets/javascripts/*.compiled.js' ':!./app/assets/javascripts/i18n/*' ':!/app/assets/javascripts/site/1.0.0/libs/*' ':!./app/assets/javascripts/admin/plugins/*'`
}
function def()
{
  alias "$1" 2>/dev/null
  which -a "$1" 2>/dev/null
  declare -f "$1" 2>/dev/null
}

#ff() {
#  # Name: Fuzzy Finder for Bash
#  # Author: Joshua Toyota
#  # Created At: 2012-06-14 11:25:00
#  # Description:
#  #    Find files with a series of letters in the given order, but not necessarily next to each other.

#  # [ original ]
#  # find . -type f | \grep -i "$(echo "$1" | sed 's/./&.*/g')"
#  find . -not -path "*tmp*" -not -path "*public*" -not -path "*.git*" | grep -i "$(echo "$1" | sed 's/./&.*/g')"

#  # --------------
#  # Usage:
#  #
#  # # finding a test: features/customer_service_issues_refunds.feature
#  # $> ff featcustservissuesrefunfeatu
#  # ./features/customer_service_issues_refunds.feature
#  #
#  # # finding: app/controllers/customers/deals_controller.rb
#  # $> ff appcontrcustdealcontrrb
#  # ./app/controllers/customers/deals_controller.rb
#  # ./app/controllers/customers/ecommerce/deals_controller.rb
#  #
#  # # ---------------
#  #
#  # just like the gs() function i wrote…this can be used as input to any other command like vim/cucumber
#  #
#  # $> cucumber $(ff featcustservissuesrefunfeatu)
#}
# END - JT customizations
# -----------------------------------------------------------
#
# Installing FHIR Validator
# ### Install Java
# check to see if it is installed first
# `java --version`
# - install
# https://download.oracle.com/java/19/latest/jdk-18_macos-aarch64_bin.dmg
#
# ### Maven
# https://maven.apache.org/install.html
# download: `jdk-18_linux-aarch64_bin.tar.gz`
# extract to: `/Users/jon.turner/maven/apache-maven-3.8.6/`
#
# add to zshrc
# export PATH="/Users/jon.turner/maven/apache-maven-3.8.6/bin:$PATH"
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-18.0.2.1.jdk/Contents/Home"
#
# ### Lombok
# Download: https://projectlombok.org/download
# ~/lombok.jar
#
# ### FHIR Validator
# Download: https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator#UsingtheFHIRValidator-Downloadingthevalidator
# ~/validator_cli.jar
# ```
# % mvn -v
# Apache Maven 3.8.6 (84538c9988a25aec085021c365c560670ad80f63)
# Maven home: /Users/jon.turner/maven/apache-maven-3.8.6
# Java version: 18.0.2.1, vendor: Oracle Corporation, runtime:
# /Library/Java/JavaVirtualMachines/jdk-18.0.2.1.jdk/Contents/Home
# Default locale: en_US, platform encoding: UTF-8
# OS name: "mac os x", version: "12.5", arch: "aarch64", family: "mac"
#
# java -cp ~/lombok.jar -jar validator_cli.jar  ~/tmp_json-validation-test.json
alias fh='java -cp ~/lombok.jar -jar validator_cli.jar'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"


export PATH="$PATH:/Users/jon.turner/Library/Python/3.9/bin"

