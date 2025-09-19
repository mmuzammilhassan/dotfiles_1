-- lua/plugins/harpoon.lua
return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2", -- you were already on v2
    dependencies = { "nvim-lua/plenary.nvim", "ibhagwan/fzf-lua" },
    keys = {
        { "<leader>ha", function() require("harpoon"):list():add() end,                                    desc = "Harpoon add file" },
        { "<leader>hh", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon quick menu" },

        { "<C-h>",      function() require("harpoon"):list():select(1) end,                                desc = "Harpoon file 1" },
        { "<C-t>",      function() require("harpoon"):list():select(2) end,                                desc = "Harpoon file 2" },
        { "<C-n>",      function() require("harpoon"):list():select(3) end,                                desc = "Harpoon file 3" },
        { "<C-s>",      function() require("harpoon"):list():select(4) end,                                desc = "Harpoon file 4" },

        { "<C-S-P>",    function() require("harpoon"):list():prev() end,                                   desc = "Harpoon prev file" },
        { "<C-S-N>",    function() require("harpoon"):list():next() end,                                   desc = "Harpoon next file" },

        -- Your custom fzf-lua integration
        {
            "<leader>hp",
            function()
                local harpoon = require("harpoon")
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
            end,
            desc = "Open Harpoon with fzf-lua",
        },
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup() -- REQUIRED
    end,
}
