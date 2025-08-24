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
      update_in_insert = false,
      severity_sort = true,
    })

    -- Keymaps only set when LSP is attached
    local opts = { buffer = event.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- Capabilities for cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP servers mapped to filetypes
local lspconfig = require('lspconfig')
local servers = {
  php = "intelephense",
--  javascript = "tsserver",  -- fixed: tsserver not ts_ls
--  typescriptreact = "tsserver",
  html = "html",
  lua = "lua_ls",
  css = "cssls",
}

-- Autocmd to load servers only when filetype is used
for ft, server in pairs(servers) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ft,
    callback = function()
      lspconfig[server].setup({
        capabilities = capabilities,
      })
    end,
  })
end

-- Mason: lazy-load only when needed
require("mason").setup()
require("mason-lspconfig").setup({
  --ensure_installed = { "intelephense", "tsserver", "tailwindcss", "lua_ls", "html", "cssls" },
  ensure_installed = { "intelephense", "tailwindcss", "lua_ls", "html", "cssls" },
  automatic_installation = true,
})

-- TailwindCSS extra root_dir setup
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "php", "css", "javascript", "javascriptreact", "typescriptreact" },
  callback = function()
    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
      root_dir = lspconfig.util.root_pattern(
        "tailwind.config.js", "tailwind.config.ts", "postcss.config.js", "package.json", ".git"
      ),
    })
  end,
})

-- nvim-cmp lazy setup (only in Insert mode)
vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()

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

