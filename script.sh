#!/bin/zsh

# Color
GREEN="\033[0;32m"
NC="\033[0m"

# Var
TYPE=""
NAME=""

# Hey!
printWelcome () {
  printf "Download all public repositories on GitHub.\n"
}

takeType () {
  while :
  do
    printf "First, write if it's a ${GREEN}user${NC} or ${GREEN}org${NC}: "
    read selctedType

    case $selctedType in
      user|org)
        selctedType="${selctedType}s"
        break
        ;;
      *)
        echo "Oops, type ${GREEN}user${NC} or ${GREEN}org${NC}!\n"
        ;;
    esac
  done

  TYPE=$selctedType
}


printWelcome
takeType
#takeName

echo $TYPE
echo $NAME

# Final call
#curl "https://api.github.com/$TYPE/$NAME/repos" | grep -e 'clone_url*' | cut -d \" -f 4 | xargs -L1 git clone 

exit 0

