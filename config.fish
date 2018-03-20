# Sublime Text
set -gx EDITOR 'subl -w'

# virtualfish
source ~/.virtualfish/virtual.fish
source ~/.virtualfish/projects.fish

# activate builtin plugins
# eval (python -m virtualfish auto_activation global_requirements)
eval (python -m virtualfish auto_activation global_requirements compat_aliases projects)

# pyenv
# set -x pyenvshortcut
# eval "$(pyenv init -)"

function mkdirc
    mkdir $argv
    cd $argv
end

# vim in shell
set fish_key_bindings fish_vi_key_bindings
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
