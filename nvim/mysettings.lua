-- write only if changed
vim.api.nvim_set_keymap('n', '<Leader>w', ':up<CR>', {noremap = true})

vim.cmd([[
    nmap <leader>b :Telescope buffers<cr>
    nmap <leader>t :Telescope tags<cr>
    nmap <leader>h :History<cr>
    nmap <leader>n :nohlsearch<cr>
    nmap <leader><leader>r :e ~/roku.sh<cr>
    nmap <leader><leader>v :e ~/.config/nvim/init.lua<cr>
]])
-- nmap <leader>l :Telescope live_grep<cr>
-- nmap <leader>f :Telescope find_files<cr>

vim.cmd([[
    if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
      au BufReadPost,BufNewFile *.brs setfiletype basic
    endif
]])
