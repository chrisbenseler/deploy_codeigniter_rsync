#!/bin/bash

USER="my_user"
HOST="my_host"
DIRPATHONHOST="/any_path/"

rsync -CavzR -e ssh --exclude 'cache' --exclude 'logs' application/ system/ $USER@$HOST:$DIRPATHONHOST

