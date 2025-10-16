case "$(arch)" in
    arm64)

        alias l="ls -A"
        alias c="clear"
        alias ll="ls -l"
        alias f="fzf --height 40% --layout reverse --border"


        # Git
        alias gc="git commit -m"
        alias gca="git commit -a -m"
        alias gp="git push origin HEAD"
        alias gpu="git pull origin"
        alias gst="git status"
        alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
        alias gdiff="git diff"
        alias gco="git checkout"
        alias gb="git branch"
        alias gba="git branch -a"
        alias gadd="git add"
        alias ga="git add -p"
        alias gcoall="git checkout -- ."
        alias gr="git remote"
        alias gre="git reset"

        # K8s
        alias k="kubectl"
        alias ka="kubectl apply -f"
        alias kg="kubectl get"
        alias kd="kubectl describe"
        alias kdel="kubectl delete"
        alias kl="kubectl logs"
        alias kgpo="kubectl get pod"
        alias kgd="kubectl get deployments"
        alias kc="kubectx"
        alias kns="kubens"
        alias kl="kubectl logs -f"
        # alias ke="kubectl exec -it"

        # Python Setup
        # Uv activate virtualenv
        alias pa="overlay use .venv/bin/activate.nu"
        alias pd="overlay hide"

        export PATH="/usr/local/bin:$PATH"
        export PATH="/opt/homebrew/bin:$PATH"
        export PATH="$HOME/.local/bin:$PATH"

        # Setup fnm
        eval "$(fnm env --use-on-cd --shell zsh)"

        eval "$(zoxide init zsh)"

        eval "$(starship init zsh)"

        # export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
        # zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
        # source <(carapace _carapace)



        ;;
    i386)

        # export LDFLAGS="-L/opt/homebrew/opt/gettext/lib"
        # export CPPFLAGS="-I/opt/homebrew/opt/gettext/include"
        # export PKG_CONFIG_PATH="/opt/homebrew/opt/gettext/lib/pkgconfig"


        export LDFLAGS="-L/usr/local/opt/zlib/lib"
        export CPPFLAGS="-I/usr/local/opt/zlib/include"
        export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

        export LC_ALL=en_US.UTF-8
        export LC_CTYPE=en_US.UTF-8

        export PYENV_ROOT="$HOME/.pyenv"
        [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"

        fpath+=~/.zfunc
        autoload -Uz compinit && compinit

        # Load homebrew formulae
        export PATH="/usr/local/sbin:$PATH"
        eval "$(/usr/local/bin/brew shellenv)"


        ### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
        export PATH="/Users/hugosilva/.rd/bin:$PATH"
        ### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

        alias glg="git log --all --decorate --oneline --graph"


        # Created by `pipx` on 2024-10-07 16:17:22
        export PATH="$PATH:/Users/hugosilva/.local/bin"

        # SETUP NODEJS
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


        # SETUP GOLANG
        [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

    ;;
  *)
    echo "Unknown architecture: $(arch)"
    ;;
esac
