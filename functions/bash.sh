function tinyps1() {
	PS1=" > \W: "
}

function echo_br() {
	seq -s "-" 74 | sed 's/[0-9]//g'
}
