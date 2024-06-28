#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Assembly Functions
# Build and Run Assembly Files
alias assemble='function _assemble() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: assemble <asm_file>"
        return 1
    fi

    local asm_file="$1"
    local obj_file="${asm_file%.asm}.o"
    local exe_file="${asm_file%.asm}"

    nasm -felf64 "$asm_file" && ld "$obj_file" -o "$exe_file" && "./$exe_file"
}; _assemble'

# Destroy Assembly .o files and executables based on the .asm file
alias unassemble='function _unassemble() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: unassemble <asm_file>"
        return 1
    fi

    local asm_file="$1"
    local obj_file="${asm_file%.asm}.o"
    local exe_file="${asm_file%.asm}"

    if [[ -f "$obj_file" ]]; then
        rm "$obj_file"
        echo "Removed $obj_file"
    else
        echo "$obj_file does not exist"
    fi

    if [[ -f "$exe_file" ]]; then
        rm "$exe_file"
        echo "Removed $exe_file"
    else
        echo "$exe_file does not exist"
    fi
}; _unassemble'

alias lg='lazygit'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias v='nvim'
alias spt='bash_scripts/spt.sh'
alias update='bash_scripts/update-all.sh'
alias pb='bash_scripts/toggle_polybar.sh'
alias clc='clear'
PS1='[\u@\h \W]\$ '


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jazz/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jazz/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jazz/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jazz/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

