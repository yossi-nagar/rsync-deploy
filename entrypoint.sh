#!/bin/bash
set -x

SSHPATH="$HOME/.ssh"
mkdir "$SSHPATH"
echo "$DEPLOY_KEY" > "$SSHPATH/key"
chmod 600 "$SSHPATH/key"
SERVER_DEPLOY_STRING="$USERNAME@$SERVER_IP:$SERVER_DESTINATION"
# sync it up"
# sh -c "rsync $ARGS -e 'ssh -i $SSHPATH/key -p $SERVER_PORT' $GITHUB_WORKSPACE/$FOLDER $SERVER_DEPLOY_STRING"
rsync "$ARGS" -e "ssh -oHostKeyAlgorithms=+ssh-dss -i $SSHPATH/key -p $SERVER_PORT" "$GITHUB_WORKSPACE/$FOLDER $SERVER_DEPLOY_STRING";
