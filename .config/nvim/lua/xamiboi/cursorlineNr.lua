--  vim.cmd("highlight CursorLineNr guifg=NONE guibg=#eae2e3 gui=NONE")
--
-- Highlight for CursorLineNr
local hl_on = "highlight CursorLineNr guifg=NONE guibg=#f2e9e1 gui=NONE"
local hl_off = "highlight clear CursorLineNr"

-- Create a single autocommand group
vim.api.nvim_create_augroup("CursorLineNrToggle", { clear = true })

-- Use a single autocmd with logic inside
vim.api.nvim_create_autocmd("ModeChanged", {
  group = "CursorLineNrToggle",
  pattern = "*",
  callback = function()
    local mode = vim.fn.mode()
    if mode == "n" then
      vim.cmd(hl_on)
    elseif mode:match("[vV\22]") then
      vim.cmd(hl_off)
    end
  end,
})

-- Set initial highlight
vim.cmd(hl_on)

