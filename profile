
EDITOR=vim
PATH=$HOME/bin:$PATH
#MANPATH=/opt/local/share/man:$MANPATH
export EDITOR PATH #MANPATH

# Go stuff
#GOROOT=$HOME/src/go
#GOARCH=amd64
#GOOS=darwin
#GOPATH=$HOME/go
#PATH=$GOROOT/bin:$GOPATH/bin:$PATH
#export GOROOT GOARCH GOOS GOPATH PATH

# OS X 10.8 does not come with GNU grep.
#export GREP_OPTIONS=--exclude-from=/Users/dsymonds/.grep-ignores
export GREP_OPTIONS=--color

#CDPATH=.:$GOPATH/src/github.com/dsymonds:$GOPATH/src/github.com/golang:$GOPATH/src/google.golang.org:$GOPATH/src/golang.org

if [ -f $HOME/.git-completion.sh ]; then
  echo -n "Loading git completion... " 1>&2
  source $HOME/.git-completion.sh
  echo "done" 1>&2
fi

# gcloud stuff
#[ -f $HOME/src/google-cloud-sdk/path.bash.inc ] && source $HOME/src/google-cloud-sdk/path.bash.inc
#[ -f $HOME/src/google-cloud-sdk/completion.bash.inc ] && source $HOME/src/google-cloud-sdk/completion.bash.inc

# Shut up about bash deprecation (new as of macOS 10.15 Catalina).
export BASH_SILENCE_DEPRECATION_WARNING=1

# Homebrew
eval $(/opt/homebrew/bin/brew shellenv)
