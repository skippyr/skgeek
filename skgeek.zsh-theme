setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT="1"

function precmd {
	function precmd {
		echo
	}
}

function _skgeek::venv {
	typeset -r venv=${VIRTUAL_ENV##*/}
	[[ -n ${venv} ]] &&
	echo " using %F{blue}${venv}%f"
}

function _skgeek::changes {
	typeset -r changes=$(git status --porcelain 2>/dev/null)
	[[ -n ${changes} ]] && echo "*"
}

function _skgeek::branch {
	typeset -r branch=$(git branch --show-current 2>/dev/null)
	[[ -n ${branch} ]] && echo " on %F{green}${branch}$(_skgeek::changes)%f"
}

PROMPT='  %F{yellow}%n%F{red}@%F{cyan}%m%f$(_skgeek::venv) in %F{red}%1~%f$(_skgeek::branch)%(?.. status %F{magenta}%?%f)
$ '
