#!/bin/sh

# I keep a copy of the raw files on my OneDrive so I can easily pull them into free42 on my tablet and phone.

if [ -e bin -a -e src_42s ]; then
  if [ -e bin/ALL.raw ]; then
    if [ $(find src_42s -name '*.hp42s' -a -newer bin/ALL.raw | wc -l) -gt 0 ]; then
      echo ""
      echo "WARNING: Some source files are newer than ALL.raw"
      echo ""
      echo "Newer Source Files"
      find src_42s -name '*.hp42s' -a -newer bin/ALL.raw | sed 's/^/        /'
      echo ""
      echo "Preforming Update.."
      echo ""
    fi
    cp bin/ALL.raw ~/winHome/OneDrive/Downloads/42s/
    cp bin/*/*.raw ~/winHome/OneDrive/Downloads/42s/

    echo "Contents of OneDrive:"
    ls -lGh ~/winHome/OneDrive/Downloads/42s/ | grep -v 'total' | sed 's/^.*richmit /        /'
  else
    echo "ERROR: Could not find bin/ALL.raw.  Generate it!"
  fi
else
  echo "ERROR: Could not find bin/ and/or src_42s.  Run from base of repo."
fi

