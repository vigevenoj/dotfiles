" markdown file type
if exists("did\_load\_filetypes")
	finish
endif
augroup markdown
	au BufRead,BufNewFile *.markdown 	setfiletype=mkd
	au BufRead,BufNewFile *.mkd 	setfiletype=mkd
augroup END
