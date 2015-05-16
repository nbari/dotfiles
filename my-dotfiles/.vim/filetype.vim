" ajust the path to your nginx
au BufRead,BufNewFile /etc/nginx/*,/usr/local/etc/nginx/* if &ft == '' | setfiletype nginx | endif
