#!/bin/bash

rm -f *~ */*~ */*/*~

didsomething='FALSE'

while [ -n "$1" ]; do
  NAME="$(basename $1 .org)"

  if [ -e src/$NAME.org ]; then
    git add src/$NAME.org
    didsomething='TRUE'
  fi  
  if [ -e src/$NAME.html ]; then
    echo "WARNING: Had to move HTML from src to doc: $NAME.html"
    mv src/$NAME.html docs/
    didsomething='TRUE'
  fi
  if [ -e docs/$NAME.html ]; then
    git add docs/$NAME.html
    didsomething='TRUE'
  fi
  if [ -e bin/$NAME/ ]; then
    git add bin/$NAME/*.raw
  fi
  if [ -e src_42s/$NAME/ ]; then
    git add src_42s/$NAME/*.hp42s
  fi
  
  shift
done

if [ "$didsomething" = "TRUE" ]; then
  git add docs/index.html docs/index.org
fi
git s
if [ "$didsomething" = "FALSE" ]; then
  echo "ERROR: No actions taken"
  echo "ERROR: No actions taken"
  echo "ERROR: No actions taken"
  echo "ERROR: No actions taken"
  echo "ERROR: No actions taken"
else
  echo "git commit -m ''"
  echo "git push"
  echo ""
  echo "git commit --allow-empty -m 'Trigger rebuild'"
  echo "git push"
fi
