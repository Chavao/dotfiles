function pless {
  pygmentize -O encoding=UTF-8 $1 | less -r
}