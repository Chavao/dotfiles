function kdocker {
    echo "Stopping docker container: $1"
    docker stop $1 | xargs echo "Stopped"
    echo "Removing docker container: $1"
    docker rm $1 | xargs echo "Removed"
}
