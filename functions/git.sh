function push {
   echo "git push -u origin $(git rev-parse --symbolic-full-name --abbrev-ref HEAD)"
   git push -u origin $(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
}

function pushf() {
   printf "Force push to branch $(git rev-parse --symbolic-full-name --abbrev-ref HEAD)? [y/N]: "
   read PUSH_FORCE_BRANCH

   if [ ! -z $PUSH_FORCE_BRANCH ]
   then
      if [ $PUSH_FORCE_BRANCH '==' 'y' ]
      then
         echo "git push --force -u origin $(git rev-parse --symbolic-full-name --abbrev-ref HEAD)"
         git push --force -u origin $(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
       fi
    fi
}
