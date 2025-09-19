return {
    {
        "mason-org/mason.nvim",
        build = ":MasonUpdate",
        lazy = true,
        config = true,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUpdate" },
        dependencies = { "mason-org/mason.nvim" },
        config = true,
        lazy = false,
        opts = {
            ui = {
                border = " rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },
}
