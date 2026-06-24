# quietink.nvim

Clean coding

## Variants

- `dark` — main variant, closest to koda's dark
- `blue` — cool steel-blue tint
- `green` — warm moss-green tint
- `light` — warm paper background

## Installation

Using `lazy.nvim`:

```lua
{
  "dgrco/quietink.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- require("quietink").setup({})
    vim.cmd("colorscheme quietink")
  end,
}
```

Using `vim.pack`:

```lua
vim.pack.add({
  "https://github.com/dgrco/quietink.nvim",
})
vim.cmd("colorscheme quietink")
```

## Usage

`quietink` auto-switches between variants based on `vim.o.background`:

```lua
vim.cmd("colorscheme quietink") -- auto-switches based on background
```

Or set a variant explicitly:

```vim
colorscheme quietink-dark
colorscheme quietink-blue
colorscheme quietink-green
colorscheme quietink-light
```

## Configuration

> [!IMPORTANT]
> Configure setup BEFORE calling `vim.cmd("colorscheme quietink")`.

```lua
require("quietink").setup({
  transparent = false,

  -- which concrete variant to use when vim.o.background is dark/light
  theme = {
    dark = "dark", -- 'dark' | 'blue' | 'green'
    light = "light",
  },

  auto = true,  -- only load highlights for plugins it detects (lazy.nvim, mini.deps, vim.pack)
  cache = true,

  styles = {
    functions = {},
    keywords = {},
    comments = {},
    strings = {},
    constants = {},
  },

  colors = {
    -- func = "#aecdf2",
    -- keyword = "#8d96a8",
  },

  on_highlights = function(hl, c)
    -- hl.LineNr = { fg = c.info }
    -- hl.Comment = { fg = c.emphasis, italic = true }
  end,
})
```

## API

```lua
local quietink = require("quietink")
local colors = quietink.get_palette("dark") -- merged palette incl. user overrides

some_plugin.error = quietink.blend(colors.danger, colors.bg, 0.3)
```

Reload highlights manually:

```
:QuietinkFetch
```

## Supported plugins

- blink.cmp
- dashboard-nvim
- flash.nvim
- fzf-lua
- gitsigns.nvim
- mason.nvim
- mini.pick / mini.statusline / mini.icons / mini.jump2d
- modes.nvim
- neo-tree.nvim
- oil.nvim
- rainbow-delimiters.nvim
- render-markdown.nvim
- snacks.dashboard / snacks.input / snacks.notifier / snacks.picker
- telescope.nvim
- treesitter
- trouble.nvim

## Extras

Terminal configs in `extras/`, generated directly from the same palette data the Neovim theme uses (`extras/generate_terminal_themes.lua`) so they can't drift out of sync:

- `extras/alacritty/quietink-{dark,blue,green,light}.toml`
- `extras/foot/quietink-{dark,blue,green,light}.ini`
- `extras/lazygit-dark.yml`
