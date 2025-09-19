return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
  },
  { "hrsh7th/cmp-nvim-lsp", lazy = true },
  { "hrsh7th/cmp-path", lazy = true },
  { "hrsh7th/cmp-buffer", lazy = true },
  {
    "saadparwaiz1/cmp_luasnip",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
      },
      { "rafamadriz/friendly-snippets" },
    },
  },
  { "hrsh7th/cmp-nvim-lua", ft = "lua" },
}

