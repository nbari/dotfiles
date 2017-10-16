# ----------------------------------------------------------------------------
# Put custom alias, vars here
# ----------------------------------------------------------------------------

export ANSIBLE_CONFIG=~/ansible/ansible.cfg
export ANSIBLE_RETRY_FILES_ENABLE=0
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home

# The next line updates PATH for the Google Cloud SDK.
if [[  -a ~/google-cloud-sdk/path.zsh.inc ]]; then
    source ~/google-cloud-sdk/path.zsh.inc
fi


# The next line enables shell command completion for gcloud.
if [[ -a ~/google-cloud-sdk/completion.zsh.inc ]]; then
    source ~/google-cloud-sdk/completion.zsh.inc
fi

# App Engine
if [[ -d ~/go_appengine ]]; then
    export PATH=$HOME/go_appengine:$PATH
fi
