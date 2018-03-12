" adjust the path to your nginx
au BufRead,BufNewFile /etc/nginx/*,/usr/local/etc/nginx/* if &ft == '' | setfiletype nginx | endif

" adjust the path to your ansible playbooks
au BufRead,BufNewFile ~/projects/ansible/*/*.yml,~/ansible/*/*.yml if &ft == '' | setfiletype ansible | endif
