#!/bin/sh

# I keep a copy of the raw files on my OneDrive so I can easily pull them into free42 on my tablet and phone.


echo "Contents of OneDrive:"
ls -lGh ~/winHome/OneDrive/Downloads/42s/ | grep -v 'total' | sed 's/^.*richmit /        /'
echo ""

if [ -e bin -a -e src_42s ]; then
  if [ -e bin/ALL.raw ]; then
    if [ $(find src_42s -name '*.hp42s' -a -newer bin/ALL.raw | wc -l) -gt 0 ]; then
      echo ""
      echo "WARNING: Some source files are newer than ALL.raw"
      echo ""
      echo "Newer Source Files"
      find src_42s -name '*.hp42s' -a -newer bin/ALL.raw | sed 's/^/        /'
      echo ""
      echo "Checking RAW files.."
      echo ""
    fi
    ANY_UPDATED='FALSE'
    for f in bin/ALL.raw bin/*/*.raw; do
      fb=$(basename $f)
      if diff -b $f ~/winHome/OneDrive/Downloads/42s/$fb 2>/dev/null >/dev/null; then
        true
      else
        echo Updateing ~/winHome/OneDrive/Downloads/42s/$fb
        cp $f ~/winHome/OneDrive/Downloads/42s/$fb
        ANY_UPDATED='TRUE'
      fi
    done
    if [ "$ANY_UPDATED" = "TRUE" ]; then
    echo ""
      echo "Contents of OneDrive:"
      ls -lGh ~/winHome/OneDrive/Downloads/42s/ | grep -v 'total' | sed 's/^.*richmit /        /'
    else
      echo "No updates made to OneDrive."
    fi
  else
    echo "ERROR: Could not find bin/ALL.raw.  Generate it!"
  fi
else
  echo "ERROR: Could not find bin/ and/or src_42s.  Run from base of repo."
fi

