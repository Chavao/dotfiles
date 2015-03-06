function push {
   echo "git push -u origin $(git rev-parse --symbolic-full-name --abbrev-ref HEAD)"
   git push -u origin $(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
}
