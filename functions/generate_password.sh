function generate_password {
    head /dev/urandom | sha224sum | cut -d " " -f 1
}
