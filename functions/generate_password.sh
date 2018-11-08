function generate_password {
    p_pass=$(head /dev/urandom | base64 | awk '{ sub ("\\\\$", ""); printf "%s", $0 } END { print "" }')
    echo ${p_pass:0:499}
}
alias genpass='generate_password'
