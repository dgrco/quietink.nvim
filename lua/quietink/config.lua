---@type Quietink.Config
local defaults = {
  transparent = false,

  -- which physical variant to use when vim.o.background is 'dark' / 'light'
  theme = {
    dark = "dark",   -- 'dark' | 'blue' | 'green'
    light = "light",
  },

  auto = true,   -- only load highlights for plugins detected via lazy.nvim / mini.deps / vim.pack
  cache = true,  -- cache compiled highlights for faster startup

  styles = {
    functions = { bold = true },
    keywords = {},
    comments = {},
    strings = {},
    constants = {},
  },

  colors = {},        -- user palette overrides, merged into the active variant
  on_highlights = nil, -- function(hl, c) ... end
}

local M = {}

M.options = vim.deepcopy(defaults)

---@param opts Quietink.Config|nil
function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", vim.deepcopy(defaults), opts or {})
end

function M.defaults()
  return defaults
end

return M
