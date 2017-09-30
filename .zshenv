function dm-env() {
  eval "$(docker-machine env "${1:-default}")"
}

function _pygrep() {
  GIT_ROOT=$(git rev-parse --show-toplevel)
  grep -Hrni --color --include "*.py" "$1" $GIT_ROOT;
}

function _jsgrep() {
  GIT_ROOT=$(git rev-parse --show-toplevel)
  grep -Hrni --color --include '*.html' --include '*.scss', --include '*.js' \
    "$1" $GIT_ROOT/app/static/js/angular $GIT_ROOT/app/templates;
}

alias dmstart="docker-machine start default && dm-env default"
alias dmstop="docker-machine stop default"
alias slvim="/work/dev-helps/tmux-starlight.sh"
alias pygrep="_pygrep"
alias grepj="grep -HrniI"
alias jsgrep="_jsgrep"
