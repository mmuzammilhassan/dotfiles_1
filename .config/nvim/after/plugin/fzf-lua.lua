vim.keymap.set("n", "<leader>pf", "<cmd>FzfLua files<CR>", { desc = "FZF Find Files" })
vim.keymap.set("n", "<leader>ps", "<cmd>FzfLua live_grep_native<CR>", { desc = "FZF Live GrepHelp" })
vim.keymap.set("n", "<C-p>", "<cmd>FzfLua git_files<CR>", { desc = "FZF Git Files" })
vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "FZF Buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>", { desc = "FZF Help" })
vim.keymap.set("n", "<leader>pc", "<cmd>FzfLua colorschemes<CR>", { desc = "Pick Colorscheme" }) --for theme search

--require('fzf-lua').setup({
--  winopts = {
--    border = 'rounded',  -- Valid options: 'single', 'double', 'rounded', 'solid', 'shadow', 'none'
--    height = 0.85,
--    width = 0.85,
--    row = 0.5, --0.15
--    col = 0.5,
--    preview = {
--      layout = 'flex',  -- or 'vertical', 'horizontal' | 'flex'
--      vertical = 'up:50%',  -- or 'down:50%'
--      horizontal = 'right:50%', -- or 'left:50%'
--      delay = 0,  -- no delay
--      border = 'rounded',
--    },
--  },
--})
--
