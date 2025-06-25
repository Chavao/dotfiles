function pport {
   sudo lsof -t -i :"$1";
}

function kport {
  sudo lsof -t -i :"$1" | xargs sudo kill -9
}
