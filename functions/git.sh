function git_prompt() {
    if [ $(__git_ps1) ]; then
        printf ' '
        printf $(__git_ps1)
    fi
}
