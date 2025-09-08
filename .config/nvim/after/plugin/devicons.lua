require'nvim-web-devicons'.setup {
 -- your personal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = " ",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
 -- globally enable "strict" selection of icons - icon will be looked up in
 -- different tables, first by filename, and if not found by extension; this
 -- prevents cases when file doesn't have any extension but still gets some icon
 -- because its name happened to match some extension (default to false)
 strict = true;
 -- set the light or dark variant manually, instead of relying on `background`
 -- (default to nil)
 variant = "light|dark";
 -- same as `override` but specifically for overrides by filename
 -- takes effect when `strict` is true
 override_by_filename = {
  [".gitignore"] = {
    icon = " ",
    color = "#f1502f",
    name = "Gitignore"
  }
 };
 -- same as `override` but specifically for overrides by extension
 -- takes effect when `strict` is true
 override_by_extension = {
  ["log"] = {
    icon = " ",
    color = "#81e043",
    name = "Log"
  }
 };
 -- same as `override` but specifically for operating system
 -- takes effect when `strict` is true
 override_by_operating_system = {
  ["apple"] = {
    icon = " ",
    color = "#A2AAAD",
    cterm_color = "248",
    name = "Apple",
  },
    -- MY FILES ICON
    -- PHP
    ["php"] = {
      icon = " ",  -- PHP icon
      color = "#8892bf",
      name = "php",
    },
    -- Laravel
    ["laravel"] = {
      icon = " ",  -- Laravel icon (or just use php)
      color = "#f05238",
      name = "laravel",
    },
    -- Blade Templates
    ["blade"] = {
      icon = " ",  -- Blade icon (usually uses php or html, but you can customize it)
      color = "#f9e2af",
      name = "blade",
    },
    -- HTML
    ["html"] = {
      icon = " ",  -- HTML icon
      color = "#e34c26",
      name = "html",
    },
    -- TailwindCSS (Usually you might want to show a CSS icon, or you can set a custom one)
    ["tailwind"] = {
      icon = " ",  -- Tailwind or CSS icon (since Tailwind is a CSS framework)
      color = "#06b6d4",  -- Tailwind blue
      name = "tailwind",
    },
    -- CSS (For general CSS files)
    ["css"] = {
      icon = " ",  -- CSS icon
      color = "#563d7c",
      name = "css",
    },
    -- JavaScript
    ["js"] = {
      icon = " ",  -- JavaScript icon
      color = "#f1e05a",
      name = "js",
    },
    -- JSON (Just for reference)
    ["json"] = {
      icon = " ",  -- JSON icon
      color = "#f1e05a",
      name = "json",
    },
    -- Markdown
    ["md"] = {
      icon = " ",  -- Markdown icon
      color = "#5a5a5a",
      name = "md",
    },
    -- TypeScript
    ["ts"] = {
      icon = " ",  -- TypeScript icon
      color = "#3178c6",
      name = "ts",
    },
    -- Lua
    ["lua"] = {
      icon = " ",  -- Lua icon
      color = "#3a9bdc",
      name = "lua",
    },
    -- JSON
    ["json"] = {
      icon = " ",  -- JSON icon
      color = "#f1e05a",
      name = "json",
    },
    -- Dockerfile
    ["Dockerfile"] = {
      icon = "󰡨 ",  -- Dockerfile icon
      color = "#0db7ed",
      name = "Dockerfile",
    },
    -- YAML
    ["yaml"] = {
      icon = " ",  -- YAML icon
      color = "#ffcc00",
      name = "yaml",
    },
    -- Markdown
    ["md"] = {
      icon = " ",  -- Markdown icon
      color = "#5a5a5a",
      name = "markdown",
    },
     -- Nginx config
    ["nginx"] = {
      icon = " ",  -- Nginx config icon (use a generic config icon or customize)
      color = "#ff6600",
      name = "nginx","default",
    },
     -- .lock files (composer.lock, package-lock.json, etc.)
    ["lock"] = {
      icon = " ",  -- .lock file icon (custom icon, or use the JSON icon)
      color = "#5a5a5a",
      name = "lock",
    },
     -- License Files
    ["LICENSE"] = {
      icon = " ",  -- License icon
      color = "#f4b400",
      name = "LICENSE",
    },
    -- React
    ["jsx"] = {
      icon = " ",  -- React JSX icon
      color = "#61dafb",
      name = "jsx",
    },
    -- Python
    ["py"] = {
      icon = " ",  -- Python icon
      color = "#3572A5",
      name = "python",
    },
    -- Ruby
    ["rb"] = {
      icon = " ",  -- Ruby icon
      color = "#701516",
      name = "ruby",
    },
    -- Go
    ["go"] = {
      icon = " ",  -- Go icon
      color = "#00ADD8",
      name = "go",
    },
    -- Java
    ["java"] = {
      icon = " ",  -- Java icon
      color = "#b07219",
      name = "java",
    },
    -- Rust
    ["rs"] = {
      icon = " ",  -- Rust icon
      color = "#dea584",
      name = "rust",
    },
    -- Scala
    ["scala"] = {
      icon = " ",  -- Scala icon
      color = "#c22d40",
      name = "scala",
    },
    -- Swift
    ["swift"] = {
      icon = " ",  -- Swift icon
      color = "#F05138",
      name = "swift",
    },
 };
}

