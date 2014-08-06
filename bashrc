source ~/dotfiles/defaultrc

GRAY="\033[1;30m"
RED="\033[1;31m"
GREEN="\033[0;32m"
ORANGE="\033[0;33m"
BLUE="\033[1;34m"
PURPLE="\033[1;35m"
WHITE="\033[1;37m"
RESET="\033[m"

function parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit"* ]] && echo "*"
}

function parse_git_branch() {
  DIRTY=$(parse_git_dirty)
  if [[ $DIRTY ]]; then printf "$RED"
  else printf "$GRAY"
  fi
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$DIRTY/"
}

PS1="\n<\[$RED\]\#\[$RESET\]> \[$BLUE\]\w \$(parse_git_branch)\n\[$PURPLE\]$ \[$RESET\]"
