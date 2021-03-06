# Used to properly link the bash_profile, not to be done by the bashrc. See
#
#     http://askubuntu.com/a/121075/418575
#
# for more information.
if [[ -f ~/.bash_profile ]]; then
    . ~/.bash_profile
fi

# User specific environment and startup programs.
export PATH="$PATH:$HOME/.local/bin:$HOME/bin"

# Set the EDITOR for various terminal based utilities
export EDITOR=vim
