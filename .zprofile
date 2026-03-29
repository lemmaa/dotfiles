eval "$(/opt/homebrew/bin/brew shellenv)"

# set PATH so it includes user's private bin directories
#export PATH="$HOME/.cargo/bin:$PATH"
#export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

ulimit -n 4096

# LC_XXX
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# enable colorized ls output
export CLICOLOR=

# docker
#export DOCKER_HOST=tcp://u2:2375

# alias
alias bat="bat -p"
alias grep="grep --color=auto --exclude='*.pyc' --exclude-dir={.git,Product,rootfs,cache,build,bin,obj}"
alias vim0="vim -u NONE"
alias vim1="vim -u ~/.vim/.vimrc0"
alias vimm="vim -c \"normal '0\""

## Pipe anything into `clip` to forward it to Clipper
export CLIPPER_SERVER=clipper
alias clipboard='nc ${CLIPPER_SERVER} 8377'

# clipper, tmux, powerline
#export PYTHON_USER_PACKAGE_BASE="$HOME/Library/Python/3.7/lib/python/site-packages"

# set macos sdk base path
export SDKROOT=$(xcrun --sdk macosx --show-sdk-path)

# X11
export DISPLAY=:0

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Read secrets
SECRET_FILE=$HOME/.secrets
[ -e $SECRET_FILE ] && source $SECRET_FILE
