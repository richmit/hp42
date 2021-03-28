#!/bin/bash

rm -f *~ */*~ */*/*~

didsomething='FALSE'
if [ -e src/$1.org ]; then
  git add src/$1.org
  didsomething='TRUE'
fi  
if [ -e src/$1.html ]; then
  mv src/$1.html docs/
  didsomething='TRUE'
fi
if [ -e docs/$1.html ]; then
  git add docs/$1.html
  didsomething='TRUE'
fi
if [ -e bin/$1/ ]; then
  git add bin/$1/*.raw
fi
if [ "$didsomething" = "TRUE" ]; then
  git add docs/index.html docs/index.org
fi
git s
if [ "$didsomething" = "FALSE" ]; then
  echo "ERROR: No module named $1 found"
  echo "ERROR: No module named $1 found"
  echo "ERROR: No module named $1 found"
  echo "ERROR: No module named $1 found"
  echo "ERROR: No module named $1 found"
else
  echo "git commit -m ''"
  echo "git push"
  echo ""
  echo "git commit --allow-empty -m 'Trigger rebuild'"
  echo "git push"
fi
