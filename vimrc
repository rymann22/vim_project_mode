" The lines below open a file and go right back to the last line you were editing
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Map <Esc> in terminal mode to exit insert mode and return to normal mode
tnoremap <Esc> <C-\><C-n>

" Map Ctrl-w h/j/k/l to move between windows even when in the terminal
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l


" Function to create the desired layout
function! ProjectMode()
  " Open the directory explorer on the left and resize it
  Vexplore | vertical resize 20

  " Move the cursor to the right (main window)
  wincmd l

  " Open a terminal at the bottom
  belowright terminal
  " Move the cursor back to the main editing window (top right)
   wincmd k

" Resize the terminal window to 30 lines
  resize 30

endfunction

" Create a command to trigger the ProjectMode function
command! ProjectMode call ProjectMode()
