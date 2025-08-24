vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)

    if mark[1] > 0 and mark[1] <= lcount then
      -- reset to column 0 to avoid "out of range" errors
      pcall(vim.api.nvim_win_set_cursor, 0, { mark[1], 0 })
    end
  end,
})

-- FOLDING CODE AND SAVE THEM
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


--VIM/NEOVIM FOLDING CHEATSHEET
--Creating and deleting folds
--zf – Create a fold (you can give it a motion like zf} for fold till end of paragraph, or visually select and then zf).
--zd – Delete the fold at the cursor.
--zD – Delete all folds in the current line.
--zE – Eliminate (delete) all folds in the file.

--Opening folds
--zo – Open the fold under the cursor.
--zO – Open all nested folds under the cursor.
--zr – Reduce fold level (open more folds across the file).
--zR – Open all folds everywhere.

--Closing folds
--zc – Close the fold under the cursor.
--zC – Close all nested folds under the cursor.
--zm – Increase fold level (close more folds across the file).
--zM – Close all folds everywhere.

--Toggling folds
--za – Toggle the fold under the cursor (open if closed, close if open).
--zA – Toggle recursively (open/close all folds under cursor).

--Misc
--zi – Toggle folding on/off entirely (show everything unfolded).
--
