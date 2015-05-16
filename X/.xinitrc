#!/bin/sh
pkill ssh-agent
eval $(ssh-agent -s)
export SSH_ASKPASS=/usr/local/bin/ksshaskpass
exec startkde4
# startfluxbox
# exec /usr/local/bin/i3
