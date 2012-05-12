# Put the current project as a CakePHP project in the PATH
function cakemode() {
    DIR=$(pwd)'/app/Console'
    if [ -d "$DIR" ]; then
        PATH="$PATH:$DIR"
    fi
}
