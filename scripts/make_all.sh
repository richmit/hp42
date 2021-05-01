#!/bin/sh

# Note the order of the files.  This will put custom at the front of the program list followed by unit & cons.
FILES='src_42s/base/base.hp42s src_42s/date/date.hp42s src_42s/equations/equations.hp42s src_42s/sfun/sfun.hp42s src_42s/math/math.hp42s src_42s/meas/meas.hp42s src_42s/pgmforfun/pgmforfun.hp42s src_42s/phil/phil.hp42s src_42s/cons/cons.hp42s src_42s/unit/unit.hp42s src_42s/custom/custom.hp42s'

foundemall='TRUE'
for f in $FILES; do
  if [ ! -e $f ]; then
    foundemall='FALSE'
    echo "ERROR: Could not find file: $f"
  fi
done

if [ $foundemall = 'TRUE' ]; then
  cat $FILES > src_42s/ALL.hp42s
else
  echo "ERROR: Could not find expected files.  Run from base of repo."
fi


