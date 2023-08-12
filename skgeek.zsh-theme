export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt promptsubst

function __Skgeek()
{
	function Get_Virtual_Environment()
	{
		[[ ${VIRTUAL_ENV} ]] && echo " using %F{4}${VIRTUAL_ENV##*/}%f"
	}

	function Get_Changes()
	{
		[[ $(git status --porcelain 2>/dev/null) ]] && echo "*"
	}

	function Get_Branch()
	{
		typeset -r branch=$(git branch --show-current 2>/dev/null)
		[[ ${branch} ]] && echo " on %F{3}${branch}$(Get_Changes)%f"
	}

	echo                                                                        \
		"%F{3}%n%F{1}@%F{6}%m%f$(Get_Virtual_Environment) in"                    \
		"%F{1}%1~%f$(Get_Branch)%(?.. status %F{5}%?%f)\n$ "
}

PROMPT='$(__Skgeek)'
