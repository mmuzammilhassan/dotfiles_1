vim.keymap.set("n", "<leader>pf", "<cmd>FzfLua files<CR>", { desc = "FZF Find Files" })
vim.keymap.set("n", "<leader>ps", "<cmd>FzfLua live_grep<CR>", { desc = "FZF Live Grep" })
vim.keymap.set("n", "<C-p>", "<cmd>FzfLua git_files<CR>", { desc = "FZF Git Files" })
vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "FZF Buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>", { desc = "FZF Help" })

