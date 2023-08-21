export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt promptsubst

function __Skgeek__Get_Virtual_Environment()
{
    [[ ${VIRTUAL_ENV} ]] && echo " using %F{4}${VIRTUAL_ENV##*/}%f"
}

function __Skgeek_Check_For_Git_Changes()
{
    [[ $(git status --porcelain 2>/dev/null) ]] && echo "*"
}

function __Skgeek_Get_Git_Branch()
{
    typeset -r branch=$(git branch --show-current 2>/dev/null)
    [[ ${branch} ]] && echo " on"                                              \
                            "%F{3}${branch}$(__Skgeek_Check_For_Git_Changes)%f"
}

PROMPT='%F{3}%n%F{1}@%F{6}%m%f$(__Skgeek__Get_Virtual_Environment) in %F{1}%1~%f$(__Skgeek_Get_Git_Branch)%(?.. status %F{5}%?%f)
$ '
