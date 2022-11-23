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
         echo "git push --force-with-lease -u origin $(git rev-parse --symbolic-full-name --abbrev-ref HEAD)"
         git push --force -u origin $(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
       fi
    fi
}

function reb() {
    if [ -z "$1" ]; then
        TO_COMMIT=5
    else
        TO_COMMIT=$1
    fi
    echo "Running rebase..."
    echo "git rebase -i HEAD~$TO_COMMIT"
    git rebase -i HEAD~$TO_COMMIT
}

function fire {
    git stash
    git branch -D fire-alarm &> /dev/null
    git checkout -b fire-alarm
    git stash pop
    git add .
    git commit -m 'Ta pegando fogo, bicho!'
    git push -u origin $(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
}
