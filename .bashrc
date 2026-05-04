############################################################
# This section is specifically for for colorizing man page #
############################################################

# annotated by dave eddy (@yousuckatprogramming)
# explained - https://youtu.be/D0sG2fj0G4Y
# borrowed heavily from https://grml.org

# Begin blinking text mode
# I just use bold red here since my terminal has blinking disabled
export LESS_TERMCAP_mb=$'\e[1;31m'

# Begin bold text mode
export LESS_TERMCAP_md=$'\e[1;31m'

# End all special formatting started by mb/md/etc.
export LESS_TERMCAP_me=$'\e[0m'

# End standout mode
export LESS_TERMCAP_se=$'\e[0m'

# Begin standout mode
# search results - bold, yellow foreground, blue background.
export LESS_TERMCAP_so=$'\e[1;33;44m'

# End underline mode
export LESS_TERMCAP_ue=$'\e[0m'

# Begin underline mode
# underline and bold green
export LESS_TERMCAP_us=$'\e[4;1;32m'

# Begin reverse-video mode
export LESS_TERMCAP_mr=$'\e[7m'

# Begin dim/half-bright mode
export LESS_TERMCAP_mh=$'\e[2m'

# Begin subscript mode
# (probably isn't supported)
export LESS_TERMCAP_ZN=$'\e[74m'

# End subscript mode
# (probably isn't supported)
export LESS_TERMCAP_ZV=$'\e[75m'

# Begin superscript mode
# (probably isn't supported)
export LESS_TERMCAP_ZO=$'\e[73m'

# End superscript mode
# (probably isn't supported)
export LESS_TERMCAP_ZW=$'\e[75m'

# Finally wire up `man` to use `less`
# this is usually the default but let's just be sure
export MANPAGER='less'

# End of man page colorization section


# for ruby env
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# for neovim (nvim)
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# for cargo (rust)
export PATH="$HOME/.cargo/bin:$PATH"

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
