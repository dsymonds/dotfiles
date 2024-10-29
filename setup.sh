#! /bin/bash

set -e -o pipefail
cd $(dirname $0)

FILES="
	gitattributes
	gitconfig
	gitignore
	profile
	sqliterc
	screenrc
	vimrc
"

# Check for existing files. Existing symlinks are okay.
bad=0
for f in $FILES; do
  target="$HOME/.$f"
  if [ -L $target ]; then
    # TODO: Check it points at the right destination.
    continue
  fi
  if [ -e $target ]; then
    echo 1>&2 "$target already exists as a non-symlink; ignoring..."
    bad=1
    continue
  fi
  ln -sv $(pwd)/$f $target
done

if [ $bad -gt 0 ]; then
  echo 1>&2 "At least one dot file is not configured correctly."
  exit 1
fi
echo 1>&2 "All OK."
