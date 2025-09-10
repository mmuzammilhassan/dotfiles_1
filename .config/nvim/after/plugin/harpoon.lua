local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)


-- this is my custom config this is not available in online
-- basic fzf-lua configurations
vim.keymap.set("n", "<leader>hp", function()
    local entries = {}
    for _, item in ipairs(harpoon:list().items) do
        table.insert(entries, item.value)
    end

    require("fzf-lua").fzf_exec(entries, {
        prompt = "Harpoon> ",
        previewer = "builtin",
        actions = {
            ["default"] = function(selected)
                vim.cmd("edit " .. selected[1])
            end,
        },
    })
end, { desc = "Open Harpoon with fzf-lua" })

