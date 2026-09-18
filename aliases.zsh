alias cdma='cd ~/dev/epfl/ma/ma3'

alias reload='source ~/.zshrc'

alias zshconfig='nvim ~/.zshrc && source ~/.zshrc'
alias lg='lazygit'
alias plantuml='java -jar /Users/ylked/scripts/plantuml.jar'
alias publicip='curl ifcfg.me'
alias va='source venv/bin/activate'
alias vd='deactivate'
alias vc='python3 -m venv venv'

if command -v bat >/dev/null 2>&1; then
  alias cat='bat'
fi

if command -v eza >/dev/null 2>&1; then
  alias ls='eza'
fi

if command -v colorls >/dev/null 2>&1; then
  alias ls='colorls'
fi


#alias vpn='sudo openconnect --protocol=anyconnect --useragent=AnyConnect vpn.epfl.ch'

alias vpn="$DOTFILES_DIR/scripts/vpn.sh"

alias kill1='kill %1'

function newpath(){
  if [[ $# -lt 1 ]]; then
    echo "[ERROR] invalid number of arguments"
  elif [[ ! -f $DOTFILES_DIR/scripts/export.sh ]]; then
    echo "[ERROR] '$DOTFILES_DIR/scripts/export.sh' script is not found"
  else
    $DOTFILES_DIR/scripts/export.sh $1
    reload
  fi
}

