# Use antigen package man. for zsh
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
# zplug "oh-my-zsh/oh-my-zsh", as:plugin, use:"lib/*.zsh"
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
# zplug "plugins/pipenv", from:oh-my-zsh
zplug "plugins/fd", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "voronkovich/gitignore.plugin.zsh"
zplug "popstas/zsh-command-time"
zplug "agkozak/zsh-z"

# Syntax highlighting bundle.
zplug "zsh-users/zsh-syntax-highlighting"

# Load the theme.
zplug "denysdovhan/spaceship-prompt", as:theme

zplug check || zplug install

# Tell Antigen that you're done.
zplug load


# Directories to be prepended to $PATH
declare -a dirs_to_prepend
dirs_to_prepend=(
  "/usr/bin"
  "/usr/local/"
  "/usr/local/bin/"
  "$(brew --prefix ruby)/bin"
  "$(brew --prefix coreutils)/libexec/gnubin" # Add brew-installed GNU core utilities bin
  "/Users/willbowditch/.cargo/bin"
  "/Library/TeX/texbin"
)

# Explicitly configured $PATH
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:${PATH}"

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

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

COMPLETION_WAITING_DOTS="true"

ENABLE_CORRECTION="true"

 # Setup pinentry for gpg
if [ -n "$(pgrep gpg-agent)" ]; 
then     export GPG_AGENT_INFO
else
  eval $(gpg-agent --daemon)
     # eval $(gpg-agent --daemon ~/.gnupg/.gpg-agent-info)
fi

# pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"


export PATH="/usr/local/opt/gettext/bin:$PATH"
#source /usr/local/share/zsh/site-functions/pyenv.zsh

# Created by `userpath` on 2020-02-12 11:32:06
export PATH="$PATH:/Users/willbowditch/.local/bin"

# Pipx
autoload -U bashcompinit
bashcompinit
eval "$(register-python-argcomplete pipx)"

# Avoid gpg issues
export GPG_TTY=$(tty);

#GNU SED
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

#direnv
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"

export PATH="$HOME/.poetry/bin:$PATH"

# Enable ctrl x ctrl e to edit command
autoload -U edit-command-line
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

# Map home and end to begining and end of line
bindkey  "^[[1;9D"   beginning-of-line
bindkey  "^[[1;9C"   end-of-line

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# set alt return as newline
bindkey '^[^M' self-insert-unmeta

source /Users/willbowditch/.config/broot/launcher/bash/br
