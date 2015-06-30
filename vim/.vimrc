set number			" line numbers
set ts=4			" tab stop
colorscheme elflord	" color with bright comments
set history=100		" keep lines of command line history
set ruler			" show the cursor position all the time
if &term =~ "xterm"
 syntax on			" syntax color
endif


" au BufRead /etc/squid3/squid_local.conf set filetype=squid
" au BufRead wpad.dat set filetype=javascript
