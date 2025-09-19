return {
    "folke/snacks.nvim",
    lazy = false, -- loads immediately, but still lightweight
    opts = {
        dashboard = {
            sections = {
                { section = "header" },
                {
                    section = "keys",
                    -- keys = {
                    --     { icon = " ", key = "f", desc = "Find File", action = "FzfLua files" },
                    --     { icon = " ", key = "n", desc = "New File", action = "enew" },
                    --     { icon = " ", key = "r", desc = "Recent Files", action = "FzfLua oldfiles" },
                    --     { icon = "󰜘 ", key = "p", desc = "Projects", action = "FzfLua git_files" },
                    --     { icon = " ", key = "g", desc = "Git Status", action = "FzfLua git_status" },
                    --     { icon = " ", key = "q", desc = "Quit", action = "qa" },
                    -- },
                    {
                        section = "recent_files",
                        limit = 5
                    },
                },
            },
        },
        picker = {
            sources = {
                files = { hidden = true }, -- show hidden files
                grep = { hidden = true },  -- search hidden files too
            },
            win = {
                input = {
                    keys = {
                        ["<Tab>"] = { "list_down", mode = { "i", "n" } },
                        ["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
                    },
                },
            },
        },
    },
    keys = function()
        local Snacks = require("snacks")
        return {
            --            {
            --                "<leader>pf",
            --                function() Snacks.picker.files() end,
            --                desc = "Find Files",
            --            },
            -- Explorer (netrw/mini.files replacement)
            { "<leader>pn", function() Snacks.explorer() end,  desc = "File Explorer" },
            { "<leader>db", function() Snacks.dashboard() end, desc = "Open Snacks Dashboard" },
        }
    end,
}
