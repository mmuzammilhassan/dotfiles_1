--require("lazy").setup({
--  spec = { ... },
--  performance = {
--    rtp = {
--      disabled_plugins = {
--        "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin",
--      },
--    },
--  },
--})
--
require("lazy").setup({
    -- Core
    { "nvim-lua/plenary.nvim", lazy = true },
    --    { "wbthomason/packer.nvim", enabled = false }, -- legacy, don't use anymore

    --    -- DAP FOR PHP
    --    {
    --        "rcarriga/nvim-dap-ui",
    --        dependencies = {
    --            "mfussenegger/nvim-dap",
    --            "theHamsta/nvim-dap-virtual-text",
    --            "nvim-neotest/nvim-nio", -- 🔥 this is what’s missing
    --        },
    --        config = function()
    --            local dap = require("dap")
    --            local dapui = require("dapui")
    --
    --            dapui.setup()
    --            require("nvim-dap-virtual-text").setup()
    --
    --            dap.listeners.after.event_initialized["dapui_config"] = function()
    --                dapui.open()
    --            end
    --            dap.listeners.before.event_terminated["dapui_config"] = function()
    --                dapui.close()
    --            end
    --            dap.listeners.before.event_exited["dapui_config"] = function()
    --                dapui.close()
    --            end
    --        end,
    --    },

    -- fzf-lua
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for icons
        config = function()
            require("fzf-lua").setup({})
        end,
    },

    -- Colorscheme
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        config = function()
            vim.cmd("colorscheme rose-pine-dawn")
        end
    },

    -- Colorizer
    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({
                filetypes = { "*" },
                user_default_options = {
                    names = false,
                    RRGGBBAA = true,
                    rgb_fn = true,
                    mode = "background",
                },
            })
        end,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        build = ":TSUpdate",
    },

    -- Harpoon 2
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Undo tree
    { "mbbill/undotree" },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
    },
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUpdate" },
        dependencies = { "williamboman/mason-lspconfig.nvim" },
    },

    -- Completion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    {
        "saadparwaiz1/cmp_luasnip",
        event = "InsertEnter"
    },
    { "hrsh7th/cmp-nvim-lua" },

    -- Snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },

    -- FOR LARAVEL
    {
        "adalessa/laravel.nvim",
        dependencies = {
            "tpope/vim-dotenv",
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-neotest/nvim-nio",
            "ravitemer/mcphub.nvim", -- optional
        },
        cmd = { "Laravel" },
        event = { "VeryLazy" },
        opts = {
            lsp_server = "intelephense", -- or "phpactor"
            features = {
                pickers = {
                    provider = "fzf-lua", -- or "snacks", "telescope", "ui-select"
                },
            },
        },
        config = function(_, opts)
            local Laravel = require("laravel")
            Laravel.setup(opts)

            local map = vim.keymap.set

            -- Laravel Pickers
            map("n", "<leader>ll", function() Laravel.pickers.laravel() end, { desc = "Laravel: Open Laravel Picker" })
            map("n", "<C-g>", function() Laravel.commands.run("view:finder") end, { desc = "Laravel: Open View Finder" })
            map("n", "<leader>la", function() Laravel.pickers.artisan() end, { desc = "Laravel: Open Artisan Picker" })
            map("n", "<leader>lt", function() Laravel.commands.run("actions") end,
                { desc = "Laravel: Open Actions Picker" })
            map("n", "<leader>lr", function() Laravel.pickers.routes() end, { desc = "Laravel: Open Routes Picker" })
            map("n", "<leader>lh", function() Laravel.run("artisan docs") end, { desc = "Laravel: Open Documentation" })
            map("n", "<leader>lm", function() Laravel.pickers.make() end, { desc = "Laravel: Open Make Picker" })
            map("n", "<leader>lc", function() Laravel.pickers.commands() end, { desc = "Laravel: Open Commands Picker" })
            map("n", "<leader>lo", function() Laravel.pickers.resources() end,
                { desc = "Laravel: Open Resources Picker" })
            map("n", "<leader>lp", function() Laravel.commands.run("command_center") end,
                { desc = "Laravel: Open Command Center" })

            -- Context-aware `gf` override
            map("n", "gf", function()
                local ok, res = pcall(function()
                    if Laravel.app("gf").cursorOnResource() then
                        Laravel.commands.run("gf")
                        return
                    end
                end)
                if not ok or not res then
                    vim.cmd.normal({ "gf", bang = true })
                end
            end, { expr = false, noremap = true, desc = "Laravel: Context-aware gf" })
        end,
    }

    -- Optional (commented out)
    -- { "nvim-treesitter/playground", enabled = false },
    -- { "tpope/vim-fugitive", enabled = false },
    -- { "christoomey/vim-tmux-navigator", enabled = false },
    -- { "wakatime/vim-wakatime", enabled = false },
    -- { "kdheepak/lazygit.nvim", enabled = false },
    -- {
    --   "m4xshen/hardtime.nvim",
    --   version = "v1.0.0",
    --   dependencies = { "MunifTanjim/nui.nvim" },
    --   enabled = false,
    -- },
})
