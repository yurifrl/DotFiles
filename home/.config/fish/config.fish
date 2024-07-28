fish_add_path /opt/homebrew/bin
fish_add_path ~/.bin/google-cloud-sdk/bin
fish_add_path ~/.bin/istio/bin
fish_add_path ~/.local/bin
fish_add_path ~/.bin
fish_add_path ~/.cargo/env
fish_add_path (go env GOPATH)/bin


set -Ux USE_GKE_GCLOUD_AUTH_PLUGIN True
set -Ux GOPATH /opt/homebrew/bin/go
set -Ux NIX_GIT_CHECKS false
set -Ux AWS_REGION us-east-1
set -Ux AWS_PROFILE nsx

alias bundle="brew bundle --file=~/.config/Brewfile --cleanup"
alias z="zellij"
alias cw="cd ~/Workdir/"
alias gti="git"
alias k="kubectl"
alias l="ls -la"
alias tf="terraform"
alias v="nvim"
alias vf="vim ~/.config/fish/config.fish"
alias vi="nivm"
alias vim="nvim"
alias x="exit"

function ip-gateway
    route get default | grep gateway | awk '{print $2}'
end

# Check if the terminal emulator is Alacritty
if test "$1PASS_ENVS_LOADED" != "true"
    load_envs_from_1pass
end

atuin init fish --disable-up-arrow | source
starship init fish | source
