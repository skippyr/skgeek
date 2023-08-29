export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt promptsubst

function _skgeek {
  function get_venv {
    [[ ${VIRTUAL_ENV} ]] && echo " using %F{4}${VIRTUAL_ENV##*/}%f"
  }

  function stat_dirty {
    [[ $(git status -s 2>/dev/null) ]] && echo "*"
  }

  function get_branch {
    b=$(git branch --show-current 2>/dev/null)
    [[ ${b} ]] && echo " on %F{3}${b}$(stat_dirty)%f"
  }

  echo "%F{3}%n%F{1}@%F{6}%m%f$(get_venv) in %F{1}%1~%f$(get_branch)%(?.."\
       "status %F{5}%?%f)\n$ "
}

PROMPT='$(_skgeek)'
