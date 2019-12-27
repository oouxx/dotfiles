if status is-interactive
and not set -q TMUX
    exec tmux
end

set -xg EDITOR nvim
# go env
set -xg GOROOT /usr/lib/go
set -xg GOPATH ~/gopath/go
set -xg GOBIN $GOPATH/gobin
set -xg PATH $GOROOT/bin $GOBIN:/usr/local/bin $PATH
set -xg GOPROXY "https://goproxy.io"

# input
set -xg GTK_IM_MODULE ibus
set -xg XMODIFIERS @im ibus
set -xg QT_IM_MODULE ibus

# alias
alias ht="htop"

# command
command ibus-daemon -d -x
