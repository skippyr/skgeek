export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt promptsubst

function _skgeek_get_venv() {
  [[ ${VIRTUAL_ENV} ]] && echo " using %F{4}${VIRTUAL_ENV##*/}%f"
}

function _skgeek_get_dirty_changes() {
  [[ $(git status --porcelain 2>/dev/null) ]] && echo "*"
}

function _skgeek_get_branch() {
  local b=$(git branch --show-current 2>/dev/null)
  [[ ${b} ]] && echo " on %F{3}${b}$(_skgeek_get_dirty_changes)%f"
}

PROMPT='%F{3}%n%F{1}@%F{6}%m%f$(_skgeek_get_venv) in %F{1}%1~%f\
$(_skgeek_get_branch)%(?.. status %F{5}%?%f)
$ '
