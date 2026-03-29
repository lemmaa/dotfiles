SCRIPT_PATH=${(%):-%N}
SCRIPT_DIR=${SCRIPT_PATH:A:h}

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' %F{green}(%b)%f'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%n@%m:%~${vcs_info_msg_0_}%(?..%F{red} %?)%f %# '
RPROMPT='%*'
TIMEFMT=$'\nreal\t%*E\nuser\t%*U\nsys\t%*S\nCPU\t%P'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
conda config --set auto_activate true

# fzf
if [ ! -d "$HOME/.fzf" ] && ! command -v fzf >/dev/null 2>&1; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi
#export FZF_CTRL_T_COMMAND='(git ls-tree -r --name-only HEAD || fd -I --hidden --exclude .git) 2> /dev/null'
export FZF_CTRL_T_COMMAND='(fd -I --hidden) 2> /dev/null'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf-git
source $SCRIPT_DIR/fzf-git.sh/fzf-git.sh

# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi

# nvm
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

## tmux autostart
#command -v tmux &> /dev/null && [ -n "$PS1" ] && [ -z "$TMUX" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && exec tmux

## bun completions
#[ -s "/Users/sjlee/.bun/_bun" ] && source "/Users/sjlee/.bun/_bun"
#
## bun
#export BUN_INSTALL="$HOME/.bun"
#export PATH="$BUN_INSTALL/bin:$PATH"
