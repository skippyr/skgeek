setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT=1

__skgeek_t()
{
	Get_Virtual_Environment()
	{
		[[ ${VIRTUAL_ENV} ]] && echo " using %F{4}${VIRTUAL_ENV##*/}%f"
	}

	Get_Changes()
	{
		[[ $(git status --porcelain 2>/dev/null) ]] && echo "*"
	}

	Get_Branch()
	{
		typeset -r b=$(git branch --show-current 2>/dev/null)
		[[ ${b} ]] && echo " on %F{3}${b}$(Get_Changes)%f"
	}

	echo "%F{3}%n%F{1}@%F{6}%m%f$(Get_Virtual_Environment) in"\
	     "%F{1}%1~%f$(Get_Branch)%(?.. status %F{5}%?%f)"
}

PROMPT='$(__skgeek_t)
$ '

