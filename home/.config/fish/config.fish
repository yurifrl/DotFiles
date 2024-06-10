fish_add_path /opt/homebrew/bin
fish_add_path ~/.bin/google-cloud-sdk/bin
fish_add_path ~/.bin/istio/bin
fish_add_path ~/.local/bin
fish_add_path ~/.bin
fish_add_path ~/.cargo/env


set -Ux USE_GKE_GCLOUD_AUTH_PLUGIN True
set -Ux GOPATH /opt/homebrew/bin/go
set -Ux NIX_GIT_CHECKS false

alias vim="nvim"
alias v="nvim"
alias vi="nivm"
alias tf="terraform"
alias gti="git"
alias l="ls -la"
alias x="exit"
alias cw="cd ~/Workdir/"
alias k="kubectl"
alias bundle="brew bundle --file=~/.config/Brewfile"

function ip-gateway
    route get default | grep gateway | awk '{print $2}'
end

atuin init fish --disable-up-arrow | source
starship init fish | source


set -gx AWS_PR
set -Ux USE_GKE_GCLOUD_AUTH_PLUGIN True
set -Ux GOPATH /opt/homebrew/bin/go
set -Ux NIX_GIT_CHECKS false

alias bundle="brew bundle --file=~/.config/Brewfile"
alias clear-dns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias code=nvim
alias cw="cd ~/Workdir/"
alias gti=git
alias k="kubectl"
alias l="ls -la"
alias tf="terraform"
alias v="nvim"
alias v=nvim
alias vi="nivm"
alias vim="nvim"
alias x="exit"


function ip-gateway
    route get default | grep gateway | awk '{print $2}'
end

atuin init fish --disable-up-arrow | source
starship init fish | source
