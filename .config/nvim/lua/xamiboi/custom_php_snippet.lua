-- PHP SNIPPET CUSTOM SNIPPETS
vim.keymap.set("n", ",h", "i<?php<CR><CR><CR><CR>?><Esc>3kI", { noremap = true, silent = true })
vim.keymap.set("n", ",i", "i<?=    ?><Esc>3hi", { noremap = true, silent = true })
vim.keymap.set("n", ",o", "o<?=   ?><Esc>3hi", { noremap = true, silent = true })
vim.keymap.set("n", ",s", "xi><?=    ?><Esc>3hi", { noremap = true, silent = true })
