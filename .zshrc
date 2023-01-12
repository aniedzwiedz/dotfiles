# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# for _entry in /home/aniedzwiedz/.local/share/gem/*; do
#   if [[ -d $_entry ]]; then
#     # TODO: Add only if not there already
#     export GEM_PATH=$_entry:$GEM_PATH
#   fi
# done
# unset _entry

alias vi='lvim '
alias vim='lvim '

# If you come from bash you might have to change your $PATH.
export PATH=/home/aniedzwiedz/.local/share/gem/ruby/3.0.0/bin:/home/aniedzwiedz/.local/bin:/usr/local/bin:$PATH:


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export VISUAL=lvim
export EDITOR=lvim

# Key-bindings
bindkey -s '^o' 'ranger^M'
bindkey -s '^g' 'lazygit^M'

alias grep_all="git branch -a | tr -d \* | sed '/->/d' | xargs git grep"


alias opisz='tldr '

# https://www.youtube.com/watch?v=91p1Fp7Db5c&ab_channel=ElijahManor
alias pogoda='curl -4 wttr.in/warsaw'
alias ll='exa --long --header --git --icons '
alias tree='exa --tree --level=4 -a -I=.git --git-ignore '
alias gbb='git branch --sort=committerdate | fzf --header "Checkout Recen Branch" --preview "git diff {1} --color=always " |xargs git checkout'
alias tree='exa --tree --level=4 -a -I=.git --git-ignore '

# YT
# https://github.com/ytdl-org/youtube-dl/
alias yt_mp4_full="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'"
alias yt_mp4_720="youtube-dl -f 'bestvideo[height<=720]+bestaudio[ext=m4a]/best[ext=mp4]/best'"


# set PATH so it includes user's private .npm/lib/bin if it exists
if [ -d "$HOME/.npm/lib/bin" ] ; then
    PATH="$HOME/.npm/lib/bin:$PATH"
fi


source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

#export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border --info inline --preview-window down:1:noborder  --color fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899 --cycle'
# https://minsw.github.io/fzf-color-picker/
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#d1d1d1,bg:#302e2e,hl:#4879ab
 --color=fg+:#ff006f,bg+:#302e2e,hl+:#00eaff
 --color=info:#afaf87,prompt:#ff006f,pointer:#ff006f
 --color=marker:#08ff1d,spinner:#afaf87,header:#34d1d1
 --height 60% --layout=reverse --border --info inline  --cycle'

### export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border --preview "bat --style=numbers --color=always --line-range :50 {}"'

# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs --exclude .git'
# export FZF_DEFAULT_COMMAND='rg --files --exclude -g "!{node_modules,.git,.idea}"'

### export FZF_DEFAULT_COMMAND='/bin/fdfind --type f --follow --exclude "!{node_modules,.git,.idea}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_PREVIEW_COMMAND="bat --style=numbers,changes --wrap never --color always {} || cat {} || tree -C {}"
export FZF_CTRL_T_OPTS="--min-height 30 --preview-window down:60% --preview-window noborder --preview '($FZF_PREVIEW_COMMAND) 2> /dev/null'"


# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'


# Advanced `vcs` color customization
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='blue'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'


HISTSIZE=10000000
SAVEHIST=10000000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

#https://stackoverflow.com/questions/61568215/openssl-v1-1-1-ubuntu-20-tlsv1-no-protocols-available/61568390#61568390
# nmap --script ssl-enum-ciphers -p 443 xxsubver
export OPENSSL_CONF=/home/aniedzwiedz/openssl.cnf

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

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
plugins=(git git-extras ruby textmate kubectl docker docker-compose zsh-autosuggestions zsh-syntax-highlighting)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## work ##

alias wlfgtgw1='ssh -p 2001 194.25.144.14 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null '
alias wlfgtgw5='ssh -p 2007 194.25.144.14 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null '
alias wlpgtgw1='ssh -p 2000 194.25.144.12 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null '
alias wlpgtgw2='ssh -p 2001 194.25.144.12 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null '
alias wlpgtgw5='ssh -p 2005 194.25.144.12 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null '
alias wlpgtgw6='ssh -p 2006 194.25.144.12 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null '
alias wltgtgw1='ssh -p 2000 194.25.144.14 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null '
alias wltgtgw5='ssh -p 2005 194.25.144.14 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null '


alias mvn='/mnt/c/opt/apache-maven-3.3.9/bin/mvn -B -Darguments=-DskipTests -Dmaven.test.skip=true -DskipTests -f  pom.xml  '

