# Sublime Text
set -gx EDITOR 'subl -w'

# virtualfish
source ~/.virtualfish/virtual.fish
source ~/.virtualfish/projects.fish

# activate builtin plugins
eval (python -m virtualfish auto_activation global_requirements compat_aliases projects)

# exec (python -m virtualfish auto_activation global_requirements compat_aliases)

# pyenv
# set -x pyenvshortcut
# eval "$(pyenv init -)"

function mkdirc
    mkdir $argv
    cd $argv
end

# vim in shell
set fish_key_bindings fish_vi_key_bindings

# auto launch ssh-agent
# from: https://gist.github.com/gerbsen/5fd8aa0fde87ac7a2cae
setenv SSH_ENV $HOME/.ssh/environment

function start_agent                                                                                                                                                                    
    echo "Initializing new SSH agent ..."
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    echo "succeeded"
    chmod 600 $SSH_ENV 
    . $SSH_ENV > /dev/null
    ssh-add
end

function test_identities                                                                                                                                                                
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add
        if [ $status -eq 2 ]
            start_agent
        end
    end
end

if [ -n "$SSH_AGENT_PID" ] 
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    end  
else
    if [ -f $SSH_ENV ]
        . $SSH_ENV > /dev/null
    end  
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    else 
        start_agent
    end  
end
