HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

export PATH="$HOME/bin:$PATH"alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

setopt appendhistory
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml:~/.kube/dev.yaml
alias k=kubectl


autoload -Uz compinit
compinit
_comp_options+=(globdots)

source <(kubectl completion zsh)

autoload -Uz vcs_info
precmd() { vcs_info }

autoload -U colors && colors
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats "%{$fg[cyan]%}%b%{$reset_color%}"

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
source ~/.zshplugin/kube-ps1.plugin.zsh
KUBE_PS1_PREFIX=""
KUBE_PS1_SYMBOL_ENABLE=false
KUBE_PS1_NS_ENABLE=false
KUBE_PS1_SUFFIX=""
KUBE_PS1_DIVIDER=""
PROMPT='%{$fg_bold[green]%}%n@%m%{$reset_color%}:${PWD/#$HOME/~} $(kube_ps1):${vcs_info_msg_0_}> '

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

