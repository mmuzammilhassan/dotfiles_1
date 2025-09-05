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
        --        dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for icons
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
            vim.cmd("colorscheme rose-pine-main")
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
