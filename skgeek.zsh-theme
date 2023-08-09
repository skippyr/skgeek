setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT=1

__Skgeek()
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
        typeset -r branch=$(git branch --show-current 2>/dev/null)
        [[ ${branch} ]] && echo " on %F{3}${branch}$(Get_Changes)%f"
    }

    echo                                                                       \
        "%F{3}%n%F{1}@%F{6}%m%f$(Get_Virtual_Environment) in"                  \
        "%F{1}%1~%f$(Get_Branch)%(?.. status %F{5}%?%f)\n$ "
}

PROMPT='$(__Skgeek)'
