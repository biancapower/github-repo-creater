#!/bin/bash

read -p 'GitHub Username: ' USERNAME
read -sp 'GitHub Password: ' PASSWORD
echo
read -p 'Name of repo: ' REPO_NAME
read -p 'Description of repo (return to leave blank): ' REPO_DESC
read -p 'Private repo? "Y/N": ' PRIV_ANS

if [ "$PRIV_ANS" == "Y" ] || [ "$PRIV_ANS" == "y" ]; then
  PRIV_T_F=true
else
  PRIV_T_F=false
fi

curl -u $USERNAME:$PASSWORD https://api.github.com/user/repos  -d "{\"name\":\"$REPO_NAME\", \"description\":\"$REPO_DESC\", \"private\":$PRIV_T_F}"
git remote add origin https://github.com/$USERNAME/$REPO_NAME.git
git push -u origin master
