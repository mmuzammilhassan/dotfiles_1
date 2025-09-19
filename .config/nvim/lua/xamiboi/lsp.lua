-- Modern, lazy-loaded LSP setup
-- Goal: minimal startup cost, servers load only when needed

-- Lazy-load diagnostics config (applies only when LSP attaches)
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN]  = "",
                    [vim.diagnostic.severity.HINT]  = "",
                    [vim.diagnostic.severity.INFO]  = "",
                },
            },
            virtual_text = true,
            underline = true,
            update_in_insert = true,
            severity_sort = true,
        })

        -- Keymaps only set when LSP is attached
        local opts = { buffer = event.buf }
--      How to come back
--      Vim has a built-in jump list. After gd, just press:
--      <C-o> → go back
--      <C-i> → go forward
--      That’s the "toggle-like" navigation for all jumps (gd, :tag, /search, etc.).
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)

         -- Diagnostics (stay minimal)
        vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
        vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

-- ========================
-- Capabilities for nvim-cmp
-- ========================
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Define LSP server configs (low-level API)
local servers = {
    intelephense = {
        filetypes = { "php" },
        cmd = { "intelephense", "--stdio" },
        root_dir = function(fname)
            return vim.fs.root(fname, { "composer.json", ".git" })
        end,
        settings = {
            intelephense = {
                environment = {
                    phpVersion = "8.4",
                },
            },
        },
    },

    lua_ls = {
        filetypes = { "lua" },
        cmd = { "lua-language-server" },
        root_dir = function(fname)
            return vim.fs.root(fname, { ".luarc.json", ".git" })
        end,
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
            },
        },
    },

    ts_ls = {
        filetypes = { "javascript", "typescript", "typescriptreact" },
        cmd = { "typescript-language-server", "--stdio" },
        root_dir = function(fname)
            return vim.fs.root(fname, { "package.json", ".git" })
        end,
    },

    html = {
        filetypes = { "html" },
        cmd = { "vscode-html-language-server", "--stdio" },
        root_dir = function(fname)
            return vim.fs.root(fname, { "package.json", ".git" })
        end,
    },

    cssls = {
        filetypes = { "css", "scss", "less" },
        cmd = { "vscode-css-language-server", "--stdio" },
        root_dir = function(fname)
            return vim.fs.root(fname, { "package.json", ".git" })
        end,
    },

    emmet_ls = {
        filetypes = { "html", "twig" },
        cmd = { "emmet-ls", "--stdio" },
        root_dir = function(fname)
            return vim.fs.root(fname, { ".git" })
        end,
    },

    tailwindcss = {
        filetypes = { "html", "twig" }, -- only twig and html
        cmd = { "tailwindcss-language-server", "--stdio" },
        root_dir = function(fname)
            return vim.fs.root(fname, {
                "tailwind.config.js",
                "tailwind.config.ts",
                "postcss.config.js",
                "package.json",
                ".git",
            })
        end,
    },
}

-- Register configs and start servers on demand
for name, config in pairs(servers) do
    vim.lsp.config[name] = vim.tbl_extend("force", config, {
        capabilities = capabilities,
    })

    -- Lazy-load: start only when matching filetype opens
    vim.api.nvim_create_autocmd("FileType", {
        pattern = config.filetypes,
        callback = function(args)
            vim.lsp.start(vim.lsp.config[name], { bufnr = args.buf })
        end,
    })
end

-- Mason setup (still works fine for binaries)
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = true,
})

-- ========================
-- SNIPPETS + CMP
-- ========================
require("luasnip").config.set_config {
    history = true,                            -- Allow jumping back to previous snippet placeholders
    updateevents = "TextChanged,TextChangedI", -- Live updating of snippet
    enable_autosnippets = true,
}

require("luasnip.loaders.from_vscode").lazy_load()

-- nvim-cmp lazy setup (only in Insert mode)
vim.api.nvim_create_autocmd("InsertEnter", {
    once = true,
    callback = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            snippet = {
                expand = function(args) luasnip.lsp_expand(args.body) end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip", keyword_length = 2 },
                { name = "buffer",  keyword_length = 3 },
                { name = "path" },
            }),
        })
    end,
})
