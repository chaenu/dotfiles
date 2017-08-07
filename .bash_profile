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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ignore case in tab-completion
bind "set completion-ignore-case on"

#shell prompt customization
export PS1='\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]\n\$ '

# automatically show all tab complete options
bind "set show-all-if-ambiguous on"
bind "set bell-style none"
# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"
# Allow UTF-8 input and output, instead of showing stuff like $'\0123\0456'
bind "set input-meta on"
bind "set output-meta on"
bind "set convert-meta off"

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# set ulimit to higher number to prevent erros with grunt
ulimit -n 65536 65536

# Bash completion for git
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

### set various alias ###
# Go to default project folder, open files in sublime and run npm
alias default="cd; cd Documents/default-project/resources; sublime .; cd; cd Documents/default-project; nvm use --delete-prefix v6.9.4; npm start;"