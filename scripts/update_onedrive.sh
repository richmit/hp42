#!/bin/sh

# I keep a copy of the raw files on my OneDrive so I can easily pull them into free42 on my tablet and phone.

if [ -e bin ]; then
  if [ -e bin/ALL.raw ]; then
    mv ALL.raw ~/winHome/OneDrive/Downloads/42s/
    cp bin/*/*.raw ~/winHome/OneDrive/Downloads/42s/
    ls -l ~/winHome/OneDrive/Downloads/42s/
  else
    echo "ERROR: Could not find bin/ALL.raw.  Generate it!"
  fi
else
  echo "ERROR: Could not find bin/.  Run from base of repo."
fi

