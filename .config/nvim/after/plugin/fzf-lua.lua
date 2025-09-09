vim.keymap.set("n", "<leader>pf", "<cmd>FzfLua files<CR>", { desc = "FZF Find Files" })
vim.keymap.set("n", "<leader>ps", "<cmd>FzfLua live_grep_native<CR>", { desc = "FZF Live GrepHelp" })
vim.keymap.set("n", "<leader>pg", "<cmd>FzfLua git_files<CR>", { desc = "FZF Git Files" })
vim.keymap.set("n", "<leader>pt", "<cmd>FzfLua colorschemes<CR>", { desc = "Pick Colorscheme" })
vim.keymap.set("n", "<leader>ph", "<cmd>FzfLua help_tags<CR>", { desc = "FZF Help" })
vim.keymap.set("n", "<leader>pd", "<cmd>FzfLua awesome_colorschemes<CR>", { desc = "Download Colorscheme" }) --for theme search
vim.keymap.set("n", "<leader>pc", "<cmd>FzfLua spell_suggest<CR>", { desc = "spell_suggest" })

require("fzf-lua").setup({
    files = {
        -- this is the default command but you can override it here
        --    cmd = "fd --type f --hidden --follow --exclude .git"
        cmd = "fd --type f --hidden --follow --exclude .git --exclude .gitignore"
    }
})

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
