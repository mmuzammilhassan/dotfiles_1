-- Netrw clean UI tweaks
vim.g.netrw_banner = 0              -- hide the banner (top help text)
vim.g.netrw_liststyle = 3           -- tree view by default
--vim.g.netrw_browse_split = 4        -- don't auto-split (you control with v/s)
--vim.g.netrw_winsize = 25            -- default width for the tree

vim.cmd([[
    autocmd FileType netrw setlocal number
    autocmd FileType netrw setlocal relativenumber
]])


--:Ex with tree-like view
--Default :Ex is netrw.
--You can toggle tree mode by pressing i in netrw (switches between “long list”, “tree”, “thin list”).
--So yes — you already have a tree explorer built-in! You just need to hit i.
--⚡ My take: Stick with :Ex + i. You stay close to defaults and avoid plugin bloat like nvim-tree.
--
-- Enable line numbers in Netrw/ file explorer in neovim
-- Make netrw use tree view by default
--Explanation of netrw_liststyle:
--0 = thin listing
--1 = long listing
--2 = wide listing
--3 = tree view
--So with vim.g.netrw_liststyle = 3, every time you run :Ex, you’ll open straight into the tree explorer view.
--vim.g.netrw_liststyle = 3


-- Disable cursorline and colorcolumn in netrw
--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "netrw",
--  callback = function()
--    vim.opt_local.cursorline = false
--    vim.opt_local.colorcolumn = ""
--    vim.opt_local.signcolumn = "no" -- optional: remove sign column too
--    -- optional: you can also tweak numbers if you want
--     vim.opt_local.number = false
--     vim.opt_local.relativenumber = false
--  end,
--})
-- Example: always open in vertical split
--
--vim.g.netrw_browse_split = 2
--Values for netrw_browse_split:
--0 = open in same window (default).
--1 = new horizontal split.
--2 = new vertical split.
--3 = new tab.
--4 = previous window.
