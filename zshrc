export TERM="xterm-256color"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="miloshadzic"
# ZSH_THEME="agnoster"
ZSH_THEME="avit"
# ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status kubecontext command_execution_time root_indicator)
POWERLEVEL9K_ROOT_ICON="\uF09C"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_VCS_SHORTEN_LENGTH=16
POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH=16
POWERLEVEL9K_VCS_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_VCS_SHORTEN_DELIMITER=".."

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Import private configs
source ~/.zshrc.private

# ALIASES
alias gvim="nvim"
alias vim="nvim"
alias vi="nvim"

alias tf="terraform"
alias k="kubectl"
alias m="make"
# alias emacs='/usr/local/Cellar/emacs-plus/26.2/Emacs.app/Contents/MacOS/Emacs -nw'
export EDITOR="nvim"
# export GIT_EDITOR="emacs"

alias la="ls -a"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#


export NODE_HOME="$HOME/.apps/node"
# export JAVA_HOME="/$HOME/.apps/jdk180221"
# export JAVA_HOME="/$HOME/.apps/jdk11.0.9"
export GO_HOME="/usr/local/go"
export GOPATH="$HOME/go"

export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$NODE_HOME/bin:$PATH"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$GO_HOME/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export AWS_PAGER="cat"

aws_newcare() {
    export AWS_PROFILE=newcare
    export AWS_REGION=us-east-2
    export AWS_DEFAULT_REGION=$AWS_REGION
    export AWS_ACCOUNT_ID=371742717794
    aws ecr get-login-password \
        --region $AWS_REGION \
        | docker login \
        --username AWS \
        --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
}

aws_vikingprod() {
    export AWS_PROFILE=viking_prod
    export AWS_REGION=us-east-1
    export AWS_DEFAULT_REGION=$AWS_REGION
}

aws_vikingdev() {
    export AWS_PROFILE=viking_dev
    export AWS_REGION=eu-west-1
    export AWS_DEFAULT_REGION=$AWS_REGION
}

aws_vikingbuild() {
    export AWS_PROFILE=viking_build
    export AWS_REGION=us-east-1
    export AWS_DEFAULT_REGION=$AWS_REGION
}

aws_registrationprod() {
    export AWS_PROFILE=registrationprod
    export AWS_REGION=us-east-1
    export AWS_DEFAULT_REGION=$AWS_REGION
}

aws_vikingstaging() {
    export AWS_PROFILE=viking_dev
    export AWS_REGION=us-east-1
    export AWS_DEFAULT_REGION=$AWS_REGION
    export AWS_ACCOUNT_ID=654509864008
    aws ecr get-login-password \
        --region $AWS_REGION \
        | docker login \
        --username AWS \
        --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
}


aws_none() {
    unset AWS_PROFILE AWS_REGION AWS_DEFAULT_REGION
}

export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gcloud/credentials.json"


# alias k8_dev="kubectl config use-context k8s.dev.sothelabs.com"
# alias k8_prod="kubectl config use-context k8s.prod.sothelabs.com"
# alias k8_staging="kubectl config use-context k8s.staging.sothelabs.com"
# alias k8_internal="kubectl config use-context k8s.internal.sothelabs.com"
# alias k8_test="kubectl config use-context k8s.test.sothelabs.com"
. ~/code/ws-monorepo/tools/sh/k8

[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh
