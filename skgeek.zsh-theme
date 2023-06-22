# Enables ZSH prompt substitution.
#
# This make it substitute variables and functions in the prompt variables, but
# they need to be defined using single quotes for it to work.
setopt promptsubst
# Prevents the default changes made to the prompt when sourcing a virtual
# environment.
export VIRTUAL_ENV_DISABLE_PROMPT="1"

# To avoid conflicts with possible user defined functions, all functions defined
# in this theme use the "skgeek::" prefix.
#
# They might also use an underline character (_) at their start to make them
# harder to find when using a regular tab completition.

# If using a virtual environment, prints its base name.
function _skgeek::print_venv {
  typeset -r venv=${VIRTUAL_ENV##*/}
  [[ -n ${venv} ]] &&
  echo " using %F{blue}${venv}%f"
}

# If inside a Git repository, prints a decorator if there are changes to be
# commited.
function _skgeek::print_git_changes {
  [[ -n $(git status --porcelain 2>/dev/null) ]] &&
  echo "*"
}

# If inside a Git repository, prints the name of the branch and if there are
# changes to be commited.
function _skgeek::print_git_info {
  typeset -r branch=$(git branch --show-current 2>/dev/null)
  [[ -n ${branch} ]] &&
  echo " on %F{green}${branch}$(_skgeek::print_git_changes)%f"
}

# The "precmd" function is a ZSH builtin function that gets executed every time
# before the prompt gets printed.
#
# This setup is a work-around to make it print a new line after each command to
# make the theme be more comfortable to use.
function precmd {
  function precmd {
    echo
  }
}

PROMPT='  %F{yellow}%n%F{red}@%F{cyan}%m%f$(_skgeek::print_venv) in %F{red}%1~%f$(_skgeek::print_git_info)%(?.. status %F{magenta}%?%f)
$ '
