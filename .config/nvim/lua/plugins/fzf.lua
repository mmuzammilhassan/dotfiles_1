-- lua/plugins/fzf.lua
return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua", -- keep the command available
  keys = {
    { "<leader>pf", "<cmd>FzfLua files<CR>",                desc = "FZF Find Files" },
    { "<leader>ps", "<cmd>FzfLua live_grep_native<CR>",     desc = "FZF Live GrepHelp" },
    { "<leader>pg", "<cmd>FzfLua git_files<CR>",            desc = "FZF Git Files" },
    { "<leader>pt", "<cmd>FzfLua colorschemes<CR>",         desc = "Pick Colorscheme" },
    { "<leader>ph", "<cmd>FzfLua help_tags<CR>",            desc = "FZF Help" },
    { "<leader>pd", "<cmd>FzfLua awesome_colorschemes<CR>", desc = "Download Colorscheme" },
    { "<leader>pc", "<cmd>FzfLua spell_suggest<CR>",        desc = "spell_suggest" },
  },
  config = function()
    require("fzf-lua").setup({
      files = {
        cmd = "fd --type f --hidden --follow --exclude .git --exclude .gitignore",
      },
    })
  end,
}

--require('fzf-lua').setup({
--  winopts = {
--    border = 'rounded',  -- Valid options: 'single', 'double', 'rounded', 'solid', 'shadow', 'none'
--    height = 0.85,
--    width = 0.85,
--    row = 0.5, --0.15
--    col = 0.5,
--    preview = {
--      layout = 'flex',  -- or 'vertical', 'horizontal' | 'flex'
--      vertical = 'up:50%',  -- or 'down:50%'
--      horizontal = 'right:50%', -- or 'left:50%'
--      delay = 0,  -- no delay
--      border = 'rounded',
--    },
--  },
--})

--local fzf = require("fzf-lua")
--
--vim.keymap.set("n", "<leader>nf", function()
--    -- Show folders from current directory
--    fzf.fzf_exec("fd --type d . --hidden --exclude .git --exclude node_modules", {
--        prompt = "Pick or type folder > ",
--        actions = {
--            ["default"] = function(selected)
--                local dir = selected[1] or ""
--                dir = vim.fn.input("Folder (or new one): ", dir, "file")
--                if dir == "" then return end
--
--                vim.fn.mkdir(dir, "p")
--
--                local filename = vim.fn.input("New PHP filename: ", "", "file")
--                if filename == "" then return end
--
--                -- Add .php extension if missing
--                if not filename:match("%.php$") then
--                    filename = filename .. ".php"
--                end
--
--                local fullpath = dir .. "/" .. filename
--                local file_exists = vim.fn.filereadable(fullpath) == 1
--
--                vim.cmd("edit " .. fullpath)
--
--                -- Only generate template if file is new
--                if not file_exists then
--                    -- Generate namespace from relative path
--                    local relative_dir = vim.fn.fnamemodify(dir, ":.")
--                    local namespace = relative_dir
--                        :gsub("^%./", "") -- remove leading ./
--                        :gsub("/", "\\") -- convert to PSR-4 style
--                        :gsub("^src\\", "") -- optional: remove common root like "src"
--                    if namespace ~= "" then
--                        namespace = "namespace " .. namespace .. ";"
--                    end
--
--                    -- Class name from file name
--                    local class_name = filename:match("([%w_]+)%.php$") or "ClassName"
--
--                    -- Write boilerplate
--                    local lines = {
--                        "<?php",
--                        "",
--                        "declare(strict_types=1);",
--                        "",
--                        namespace,
--                        "",
--                        "class " .. class_name,
--                        "{",
--                        "    ",
--                        "}",
--                        ""
--                    }
--
--                    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
--                end
--            end,
--        },
--    })
--end, { desc = "Create new PHP class" })
--
---- | You want to...                     | Change this part                                           |
---- | ---------------------------------- | ---------------------------------------------------------- |
---- | Strip `src/` from namespace        | `:gsub("^src\\", "")`                                      |
---- | Use `App\\` prefix for all         | Add: `namespace = "App\\" .. namespace`                    |
---- | Auto-add `declare(strict_types=1)` | Add line after `<?php`                                     |
---- | Use PSR-4 base paths               | Add logic for matching composer.json `autoload.psr-4` keys |
---- 
