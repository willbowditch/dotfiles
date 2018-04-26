# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# gclou
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# Use antigen package man. for zsh
source /usr/local/share/antigen/antigen.zsh


# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle docker-compose
antigen bundle docker
#antigen bundle zsh-users/zsh-autosuggestions
#antigen bundle zsh-user/zsh-completions

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme avit

# Tell Antigen that you're done.
antigen apply


# Path to your oh-my-zsh installation.
# export ZSH=/Users/williambowditch/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="avit"


##========================= custom from here
# Path to your oh-my-zsh configuration.
# export ZSH=$HOME/.oh-my-zsh

# Directories to be prepended to $PATH
declare -a dirs_to_prepend
dirs_to_prepend=(
  "/usr/bin"
  "/usr/local/"
  "/usr/local/bin/"
  "$(brew --prefix ruby)/bin"
  "$(brew --prefix coreutils)/libexec/gnubin" # Add brew-installed GNU core utilities bin
)

# Explicitly configured $PATH
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

for dir in ${(k)dirs_to_prepend[@]}
do
  if [ -d ${dir} ]; then
    # If these directories exist, then prepend them to existing PATH
    PATH="${dir}:$PATH"
  fi
done

unset dirs_to_prepend

export PATH


# Load the shell dotfiles
for file in $HOME/.{exports,aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# if [ -f `brew --prefix`/etc/bash_completion ]; then
#   . `brew --prefix`/etc/bash_completion
# fi
##=========================

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
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)

#source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

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

# This is autosuggestions
 source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

 #This is completions
 fpath=(/usr/local/share/zsh-completions $fpath)

 # virtualenv wrapper
 # virtualenvwrapper
# lazy loading saves on shell startup time
workon() {
  [ -z "$PROJECT_HOME" ] && {
    unset -f workon;
    export WORKON_HOME=$HOME/.virtualenvs;
    export PROJECT_HOME=$HOME/projects/;
    source /usr/local/bin/virtualenvwrapper.sh
    }
  workon "$@"
}


 # Setup pinentry for gpg
 if [ -n "$(pgrep gpg-agent)" ]; then
     export GPG_AGENT_INFO
 else
   eval $(gpg-agent --daemon)
     # eval $(gpg-agent --daemon ~/.gnupg/.gpg-agent-info)
 fi

# For direnv
eval "$(direnv hook zsh)"

export PATH=/Users/willbowditch/Library/Python/3.6/bin:$PATH



# added by travis gem
[ -f /Users/willbowditch/.travis/travis.sh ] && source /Users/willbowditch/.travis/travis.sh

eval $(thefuck --alias)
