-- THIS IS NEOVIM SPELL SUPPORT
--vim.opt.spell = true
--vim.opt.spelllang = "en"

--KEYBINDINGS FOR SPELL CHECKING:
--[s → Go to the previous misspelled word.
--]s → Go to the next misspelled word.
--z= → Show spelling suggestions for the current word.
--zg → Add the word to your dictionary.
--zw → Mark the word as incorrect.

-- COLORSCHEME
--    vim.cmd("syntax enable")
--    vim.cmd("filetype plugin indent on")
--    vim.opt.termguicolors = true
--    vim.cmd("colorscheme wildcharm")  -- try also desert, peachpuff, ron, habamax, sorbet, wildcharm
--    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })


---- FOLDING CODE AND SAVE THEM
--vim.opt.foldmethod = "manual"  -- Important!
--vim.opt.viewoptions:remove("options")
--vim.opt.viewoptions:append({ "folds", "cursor", "curdir" })
--vim.api.nvim_create_augroup("remember_folds", { clear = true })
--vim.api.nvim_create_autocmd("BufWinLeave", {
--  pattern = "*",
--  command = "silent! mkview",
--  group = "remember_folds",
--})
--
--vim.api.nvim_create_autocmd("BufWinEnter", {
--  pattern = "*",
--  command = "silent! loadview",
--  group = "remember_folds",
--})

-- THIS IS THE FINAL NOTES.MD CODE TO TOGGLE
vim.keymap.set("n", "<leader>nn", function()
  local notes_path = vim.fn.expand("~/NOTES.md")
  local current_file = vim.api.nvim_buf_get_name(0)

  if current_file == notes_path then
    vim.cmd("edit #")
    return
  end

  vim.cmd("edit " .. notes_path)

  local date_header = "## " .. os.date("%B %d, %Y - %H:%M")
  local new_block = {
    "",
    date_header,
    "",
    "      TITLE: ",
    "             ",
    "- [ ] TO-DO: ",
    "- [ ] ERROR: ",
    "- [ ] IDEA:  ",
    "      REF:   ",
    "",
    string.rep("-", 80),
    ""
  }

  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local has_today = false
  for _, line in ipairs(lines) do
    if line:find(os.date("%B %d, %Y")) then
      has_today = true
      break
    end
  end

  if not has_today then
    -- Insert at END of file
    local last_line = #lines
    vim.api.nvim_buf_set_lines(0, last_line, last_line, false, new_block)
    vim.api.nvim_win_set_cursor(0, { last_line + 4, 8 })  -- Line 4 of new_block, column after "- TO-DO: "
    vim.cmd("startinsert!")
  else
    vim.cmd("normal! G")
    --vim.cmd("normal! gg")
    --vim.cmd("startinsert!")
  end
end, { desc = "Toggle NOTES.md with date and time block" })

-- CHECKBOX OR UNCHECKED
-- Normal mode: insert a new unchecked task
vim.keymap.set("n", "<leader>cb", "o- [ ] ", { desc = "Insert checkbox", noremap = true })
-- Visual mode: toggle selected lines into checkboxes
vim.keymap.set("v", "<leader>cb", ":<C-u>'<,'>s/^\\s*/- [ ] /<CR>", { noremap = true, desc = "Add checkboxes" })

-- PHP SNIPPET CUSTOM SNIPPETS
vim.keymap.set("n", ",h", "i<?php<CR><CR><CR><CR>?><Esc>3kI", { noremap = true, silent = true })
vim.keymap.set("n", ",i", "i<?=    ?><Esc>3hi", { noremap = true, silent = true })
vim.keymap.set("n", ",o", "o<?=   ?><Esc>3hi", { noremap = true, silent = true })
vim.keymap.set("n", ",s", "xi><?=    ?><Esc>3hi", { noremap = true, silent = true })

-- RIGHT BOTTOM SCROLL THINGY
-- https://symbl.cc/en/unicode-table/#braille-patterns  2809
--function _G.scroll_bar()
--    --local chars = { '█','▇','▆','▅','▄','▃','▂','▁' }  -- reversed!
--    --local chars = { '▁','▂','▃','▄','▅','▆','▇','█' }
--
--    --    local chars = { '▀','⠉','⠒','⠶', '━','⠤','⣀', '▄'}
--
--    local chars = { '⠉', '⣶', '▄', '⣭', '⣉', '⣛', '▀', '⠿', '⣀' }
--
--    --  local chars = { '⠉','⠒', '━','⠤','⣀'}
--    --local chars = { '⣶', '⣭', '⣛', '⠿' }
--    local current_line = vim.fn.line('.')
--    local total_lines = vim.fn.line('$')
--    local ratio = current_line / total_lines
--    local index = math.floor(ratio * (#chars - 1)) + 1
--    return chars[index]
--end

-- SET STATUSLINE
--vim.o.statusline = table.concat {
----    ' %-10{v:lua.display_mode()}', -- modes
----    ' %=',                        -- this will make statusbar in center
--    '%f',                          -- File name
--    ' %m%r%h%w',                    -- Flags
--    -- ' [%{&ff}]',              -- File format
--    -- ' [%{&fileencoding}]',
--    ' %=',
--    --'%y ',                       -- File type
--    --' %{FugitiveStatusline()} ', -- → Git info if using vim-fugitive
--    -- '%l:%c',                 -- Line and column
--    '%l,%c',                     -- Line and column
--    --' [%p%%]',                   -- Percentage through file
--    --'  ',
--    --' %{v:lua.scroll_bar()}'     -- Our scrollbar!
--}

-- Return full mode name
--function _G.display_mode()
--    local mode_map = {
--        n = "[NORMAL]",
--        no = "[N-PENDING]",
--        v = "[VISUAL]",
--        V = "[V-LINE]",
--        [""] = "[V-BLOCK]",
--        i = "[INSERT]",
--        ic = "[INSERT]",
--        R = "[REPLACE]",
--        Rv = "[V-REPLACE]",
--        c = "[COMMAND]",
--        cv = "[VIM EX]",
--        ce = "[EX]",
--        s = "[SELECT]",
--        S = "[S-LINE]",
--        [""] = "[S-BLOCK]",
--        t = "[TERMINAL]",
--    }
--
--    local current_mode = vim.api.nvim_get_mode().mode
--    return mode_map[current_mode] or current_mode
--end

--statusbar info
--vim.o.statusline = ' %t %m%r%h%w %=%l,%c %y %{FugitiveStatusline()} '
--%m → modified flag (+ if unsaved)
--%r → readonly flag
--%h → help buffer flag
--%w → preview window flag
--%= → separates left/right
--%l:%c → line:column
--%y → file type
--%{FugitiveStatusline()} → Git info if using vim-fugitive
--%F → full path in winbar

-- THIS IS WHY I GET BLINKING CURSOR
--vim.opt.guicursor = ""
vim.opt.guicursor = {
    "n-v-c:block-blinkon200-blinkoff200", -- Normal, visual, commond mode: blinking block cursor
    "i-ci:block-blinkon0-blinkoff0",      -- insert, commond insert mode: solid block cursor (no blinking)
    "v-ci:block-blinkon0-blinkoff0",      -- visual, commond visual mode: solid block cursor (no blinking)
    "r-cr:block-blinkon0-blinkoff0",      --replace mode: solid block cursor (no blinking)
}

-- MOUSE OFF
vim.keymap.set("", "<up>", "<nop>", { noremap = true })
vim.keymap.set("", "<down>", "<nop>", { noremap = true })
vim.keymap.set("i", "<up>", "<nop>", { noremap = true })
vim.keymap.set("i", "<down>", "<nop>", { noremap = true })
vim.opt.mouse = ""

-- Enable line numbers in Netrw/ file explorer in neovim
vim.cmd([[
    autocmd FileType netrw setlocal number
    autocmd FileType netrw setlocal relativenumber
]])

-- THIS DOWN LINES ARE FROM PRIMEAGEN
-- Navigation vim + tmux panes better
--vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
--vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
--vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
--vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')


-- BASIC NEOVIM SETUP
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false


-- this is i add from chatgpt
--vim.o.cmdheight = 0
vim.o.showmode = true
--vim.opt.lazyredraw = true
--vim.opt.timeoutlen = 300


vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- cursorline things
vim.opt.cursorline = true
vim.opt.cursorcolumn = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 9
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 100

vim.opt.colorcolumn = "80"

vim.opt.clipboard = "unnamedplus"
vim.opt.clipboard = "unnamed"
