export EDITOR='nvim'
export GIT_EDITOR='nvim'

export PATH="$HOME/.local/bin:$PATH"


if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_CACHE_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# zinit ice depth=1; zinit light romkatv/powerlevel10k

# PROMPT='%~ $ '
# PROMPT=$'\n%~ \nλ '

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ git:\1/'
}

# autoload -U colors && colors
# setopt PROMPT_SUBST
# PROMPT=$'%{$fg[blue]%}%~ $(parse_git_branch) \n%{$fg[blue]%}λ %{$reset_color%}%'

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab


autoload -Uz compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle 'fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':completion:*' dumpfile ~/.cache/zsh/.zcompdump

compinit
zinit cdreplay -q

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

alias vim='nvim'

alias ls='eza --group-directories-first --icons'
alias la='eza -a --group-directories-first --icons'
alias l='eza -l --group-directories-first --icons'
alias ll='eza -la --group-directories-first --icons'
alias src="source ~/.zshrc"

alias bat='bat'
alias fbat="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

alias win="cd /mnt/c/Users/kiq/"

[ -s "/home/user/.bun/_bun" ] && source "/home/user/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/.local/go"
export PATH="$GOPATH/bin:"$PATH

export _ZO_ECHO='1'

# export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi \
--preview-window=right:70%"

[ -f ~/.fzf.sh ] && source ~/.fzf.zsh

export PATH="$HOME/.cargo/bin:$PATH"

export BROWSER="/mnt/c/Windows/explorer.exe"
alias see="explorer.exe"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
