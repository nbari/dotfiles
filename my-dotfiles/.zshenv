# ----------------------------------------------------------------------------
# Put custom alias, vars here
# ----------------------------------------------------------------------------

export ANSIBLE_HOSTS=~/ansible/hosts
export ANSIBLE_CONFIG=~/ansible/ansible.cfg
export ANSIBLE_RETRY_FILES_ENABLE=0

# The next line updates PATH for the Google Cloud SDK.
if [[  -a ~/google-cloud-sdk/path.zsh.inc ]]; then
    source ~/google-cloud-sdk/path.zsh.inc
fi


# The next line enables shell command completion for gcloud.
if [[ -a ~/google-cloud-sdk/completion.zsh.inc ]]; then
    source ~/google-cloud-sdk/completion.zsh.inc
fi
