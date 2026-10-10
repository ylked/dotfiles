export DOTFILES_DIR="${${(%):-%x}:A:h}"

source "$DOTFILES_DIR/exports.zsh"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "$DOTFILES_DIR/aliases.zsh"

if [[ -f $DOTFILES_DIR/.env ]]; then
  set -a
  source $DOTFILES_DIR/.env
  set +a
fi

if [[ -f $DOTFILES_DIR/local.zsh ]]; then
  source $DOTFILES_DIR/local.zsh
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh --cmd cd)"
fi

plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker)

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
