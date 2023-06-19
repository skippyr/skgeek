setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT="1"

function _skgeek::venv {
	typeset -r venv=${VIRTUAL_ENV##*/}
	[[ -n ${venv} ]] &&
	echo " using %F{blue}${venv}%f"
}

function _skgeek::changes {
	[[ -n $(git status --porcelain 2>/dev/null) ]] &&
	echo "*"
}

function _skgeek::branch {
	typeset -r branch=$(git branch --show-current 2>/dev/null)
	[[ -n ${branch} ]] &&
	echo " on %F{green}${branch}$(_skgeek::changes)%f"
}

function precmd {
	function precmd {
		echo
	}
}

PROMPT='  %F{yellow}%n%F{red}@%F{cyan}%m%f$(_skgeek::venv) in %F{red}%1~%f$(_skgeek::branch)%(?.. status %F{magenta}%?%f)
$ '
