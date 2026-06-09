# manpage colorization
source ~/.manpage_color.sh

# for ruby env
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# for neovim (nvim)
export PATH="/opt/nvim-linux-x86_64/bin:$PATH"

# for cargo (rust)
export PATH="$HOME/.cargo/bin:$PATH"
. "$HOME/.cargo/env"

# function (alias) for activating venv
activate() {
    local venv="$1"
    source ~/.venv/$1/bin/activate
}


# function (alias) for column view of table
tidy() {
    # Usage: tidy file [delimiter]
    local table=${1:-'-'}
    local d=${2:-$'\t'}

    if [[ $table == '-' ]]; then
        column -t -s "$(printf "$d")" | less -SN
    else
        column -t -s "$(printf "$d")" $table | less -SN
    fi
}


alias vi=nvim


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# vim: ts=4 sts=4 sw=4 et
