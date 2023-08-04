setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT=1

_skgeek() {
  get_virtual_environment() {
    [[ ${VIRTUAL_ENV} ]] && echo " using %F{4}${VIRTUAL_ENV##*/}%f"
  }

  get_changes() {
    [[ $(git status --porcelain 2>/dev/null) ]] && echo "*"
  }

  get_branch() {
    typeset -r branch=$(git branch --show-current 2>/dev/null)
    [[ ${branch} ]] && echo " on %F{3}${branch}$(get_changes)%f"
  }

  echo\
    "%F{3}%n%F{1}@%F{6}%m%f$(get_virtual_environment) in"\
    "%F{1}%1~%f$(get_branch)%(?.. status %F{5}%?%f)\n$ "
}

PROMPT='$(_skgeek)'
