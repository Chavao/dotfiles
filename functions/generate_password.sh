function generate_password {
    if [ -z "$1" ]; then
        FINAL=499
    else
        FINAL=$1
    fi
    p_pass=$(head /dev/urandom | base64 | awk '{ sub ("\\\\$", ""); printf "%s", $0 } END { print "" }')
    echo ${p_pass:0:$FINAL}
}
alias genpass='generate_password'
