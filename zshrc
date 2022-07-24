if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
bindkey -e
export PATH=$PATH:/usr/local/bin:/bin:/usr/bin:/usr/sbin:/sbin/:/opt/metasploit-framework/bin/:$HOME/.dotnet/:$HOME/.dotnet/tools/:/usr/local/vitasdk/bin:/home/ezra/.local/bin
alias ls="lsd"
alias cat="bat"
alias vim="nvim"
alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf\""
alias yay="paru"
alias youtube-dl="yt-dlp"

export CC=clang
export CXX=clang++
export CPPFLAGS="-D_FORTIFY_SOURCE=2"
export CFLAGS="-march=znver2 -O2 -pipe -fno-plt -fpic -fstack-protector-strong"
export CXXFLAGS="-march=znver2 -O2 -pipe -fno-plt -fpic -fstack-protector-strong"
export LDFLAGS="-Wl,-O1,-fuse-ld=mold,--sort-common,--as-needed,-z,relro"
export RUSTFLAGS="-C opt-level=2 -C target-cpu=native"

export STEAM_COMPAT_DATA_PATH=~/.proton/
export EDITOR="nvim"
export XDG_DATA_DIRS=$XDG_DATA_DIRS:~/.local/share/flatpak/exports/share/applications:/var/lib/flatpak/exports/share/applications
export VITASDK=/usr/local/vitasdk
export ET_NO_TELEMETRY=1
export QT_QPA_PLATFORMTHEME=kvantum

HISTFILE=~/.zinit_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt INC_APPEND_HISTORY
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

zicompinit
zinit ice wait"0a" lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

zinit light zsh-users/zsh-completions
zinit light zchee/zsh-completions
zinit light redxtech/zsh-kitty
zinit ice as"completion"
zinit snippet OMZP::docker/_docker
zinit snippet OMZP::git
zinit light agkozak/zsh-z
zinit light zdharma-continuum/fast-syntax-highlighting
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zdharma-continuum/history-search-multi-word
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
zinit light Aloxaf/fzf-tab
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
