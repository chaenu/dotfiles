# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# cd to the path of the front Finder window
cdf() {
  target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
  if [ "$target" != "" ]; then
    cd "$target"; pwd
  else
    echo 'No Finder window found' >&2
  fi
}

#shell prompt customization
export PS1='\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]\n\$ '

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# set ulimit to higher number to prevent erros with grunt
ulimit -n 65536 65536

# Bash completion for git
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

### set various alias ###

# Go to default project folder, open files in sublime and run npm
alias aamt="cd; cd Documents/default-project/resources; sublime .; cd; cd Documents/default-project; nvm use --delete-prefix v6.9.4; npm start;"