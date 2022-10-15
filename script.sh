#!/bin/zsh

# Color
GREEN="\033[0;32m"
NC="\033[0m"

# TYPE = {users|orgs}
# NAME = {user or org name}
TYPE="" 
NAME=""

# Hey!
printWelcome () {
  printf "Download all public repositories on GitHub.\n"
}

# Select between users and orgs
takeType () {
  while :
  do
    printf "First, write if it's a ${GREEN}user${NC} or ${GREEN}org${NC}: "
    read TYPE

    case $TYPE in
      user|org)
        TYPE="${TYPE}s"
        break
        ;;
      *)
        echo "Oops, type ${GREEN}user${NC} or ${GREEN}org${NC}!\n"
        ;;
    esac
  done
}

# Take the name of the user or organization
takeName () {
  if [ $TYPE = "users" ]; then
    printf "Ok, now enter the username of the user: "
  else
    printf "Ok, now enter the username of the organization: "
  fi
  
  read NAME 
}

# Download the repository
executeCall () {
  curl "https://api.github.com/$TYPE/$NAME/repos" | 
  grep -e 'clone_url*' |
  cut -d \" -f 4 | 
  xargs -L1 git clone 
}

printWelcome
takeType
takeName
executeCall

exit 0