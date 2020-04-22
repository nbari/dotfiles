" adjust the path to your nginx
au BufRead,BufNewFile */nginx/* if &ft == '' | setfiletype nginx | endif
