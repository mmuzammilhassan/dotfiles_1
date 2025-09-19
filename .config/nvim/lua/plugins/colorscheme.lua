-- lua/plugins/colorscheme.lua
return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false, -- load immediately so UI looks right
  priority = 1000, -- make sure it loads before everything else
  config = function()
    require("rose-pine").setup({
      -- styles = { italic = false },
    })

    -- your function (still useful if you wanna re-run it manually)
    function ColorMyPencils(color)
      color = color or "rose-pine-dawn"
      vim.cmd.colorscheme(color)

    -- Customize specific styles
    -- :FzfLua highlights

--    vim.api.nvim_set_hl(0, "Normal", { bg = "#faf4ed" })
--    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#faf4ed" })

      -- Cursorline & colorcolumn highlights
      vim.api.nvim_set_hl(0, "cursorline", { bg = "#eae2e3" })
      vim.api.nvim_set_hl(0, "colorcolumn", { bg = "#eae2e3" })

      -- You can add back your commented-out highlights anytime here
      -- e.g. vim.api.nvim_set_hl(0, "Comment", { italic = true, fg = "#908caa" })
    end

    -- set at startup
    ColorMyPencils()
  end,
}

