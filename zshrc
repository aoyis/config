# Created by `pipx` on 2026-10-27 13:08:35
export PATH="$PATH:/home/aoyi/.local/bin"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Typeset PATH 
typeset -U path

# Run fastfetch on launch
source ~/.pokefetch

# Reveal executed alias
_aliases="$(alias -Lr 2>/dev/null || alias)"

alias_for() {
  [[ $1 =~ '[[:punct:]]' ]] && return
  local found="$( echo "$_aliases" | sed -nE "/^alias ${1}='?(.+)/s//\\1/p" )"
  [[ -n $found ]] && echo "${found%\'}"
}

expand_command_line() {
  [[ $# -eq 0 ]] && return         # If there's no input, return. Else...
  local found_alias="$(alias_for $1)"    # Check if there's an alias for the comand.
  if [[ -n $found_alias ]]; then         # If there was
    echo "\e[35m > ${found_alias}\e[0m"                  # Print it.
  fi
}

autoload -U add-zsh-hook        # Load the zsh hook module. 
add-zsh-hook preexec expand_command_line      # Adds the hook 

# Custom defined commands
mkcd() {
  echo "mkdir -p $1 && cd $1"
  mkdir -p "$1" && cd "$1"
}

alias rs="rsync -a --info=progress2"

