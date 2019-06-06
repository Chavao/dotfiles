function pport {
   lsof -t -i :"$1";
}

function kport {
  kill `pport "$1"`;
}
