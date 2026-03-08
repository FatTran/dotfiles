# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

alias ll="ls -l"
alias la="ls -la"
alias v="vim"

export PATH=$PATH:/usr/local/go/bin
export VCPKG_ROOT="${HOME}/vcpkg"
export PATH=$VCPKG_ROOT:$PATH

#export BOOST_ROOT=/usr
#export LD_LIBRARY_PATH=/usr/lib:$LD_LIBRARY_PATH
#export CPLUS_INCLUDE_PATH=/usr/include:$CPLUS_INCLUDE_PATH
