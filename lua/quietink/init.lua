local config = require("quietink.config")
local utils = require("quietink.utils")

local M = {}

M.setup = config.setup

--- Detects which plugins are installed via lazy.nvim, mini.deps, or vim.pack.
---@return table<string, boolean>
local function detect_plugins()
  local found = {}

  -- lazy.nvim
  local ok_lazy, lazy_cfg = pcall(require, "lazy.core.config")
  if ok_lazy and lazy_cfg.plugins then
    for name, _ in pairs(lazy_cfg.plugins) do
      found[name] = true
    end
  end

  -- mini.deps tracks installed modules under a known runtime path; fall back
  -- to checking common mini.nvim submodules by require
  for _, name in ipairs({ "mini.deps", "mini.pick", "mini.statusline", "mini.icons", "mini.jump2d" }) do
    if pcall(require, name) then
      found[name] = true
    end
  end

  -- vim.pack (0.12+) exposes vim.pack.get()
  if vim.pack and vim.pack.get then
    local ok_pack, list = pcall(vim.pack.get)
    if ok_pack and list then
      for _, p in ipairs(list) do
        if p.spec and p.spec.name then
          found[p.spec.name] = true
        end
      end
    end
  end

  return found
end

-- maps group-file name -> list of plugin names that, if any present, should load it
local PLUGIN_GROUP_MAP = {
  blink = { "blink.cmp" },
  explorer = { "neo-tree.nvim", "oil.nvim", "mini.icons" },
  finder = { "telescope.nvim", "fzf-lua", "mini.pick" },
  git_tools = { "gitsigns.nvim", "mason.nvim", "rainbow-delimiters.nvim", "render-markdown.nvim", "trouble.nvim" },
  misc_plugins = {
    "flash.nvim", "modes.nvim", "dashboard-nvim", "snacks.nvim",
    "mini.statusline", "mini.jump2d",
  },
}

---@param variant_name string
---@return Quietink.Palette
local function load_palette(variant_name)
  local ok, palette = pcall(require, "quietink.palette." .. variant_name)
  if not ok then
    error("quietink: unknown variant '" .. variant_name .. "'")
  end
  return palette
end

--- Returns the merged palette (base + user color overrides) for a given variant.
--- Mirrors koda's `get_palette(name)`.
---@param variant_name string|nil defaults to the currently active variant
---@return Quietink.Palette
function M.get_palette(variant_name)
  variant_name = variant_name or M._active_variant or "dark"
  local base = load_palette(variant_name)
  return utils.merge(base, config.options.colors)
end

--- Blends two hex colors. Mirrors koda's `koda.blend(fg, bg, alpha)`.
M.blend = utils.blend

---@param variant_name string one of: dark, blue, green, light
function M.load(variant_name)
  config.options = config.options or config.defaults()
  local cfg = config.options
  M._active_variant = variant_name

  local c = M.get_palette(variant_name)

  vim.g.colors_name = "quietink-" .. variant_name
  vim.o.termguicolors = true

  if vim.g.colors_name_loaded then
    vim.cmd("hi clear")
  end
  vim.g.colors_name_loaded = "quietink-" .. variant_name

  -- merge core groups first
  local groups = vim.tbl_extend(
    "force",
    {},
    require("quietink.groups.editor")(c, cfg),
    require("quietink.groups.syntax")(c, cfg)
  )

  local installed = cfg.auto and detect_plugins() or nil

  for file, plugin_names in pairs(PLUGIN_GROUP_MAP) do
    local should_load = not cfg.auto
    if installed then
      for _, name in ipairs(plugin_names) do
        if installed[name] then
          should_load = true
          break
        end
      end
    end
    if should_load then
      local mod_groups = require("quietink.groups." .. file)(c)
      groups = vim.tbl_extend("force", groups, mod_groups)
    end
  end

  if cfg.on_highlights then
    cfg.on_highlights(groups, c)
  end

  for group, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, group, spec)
  end

  -- terminal colors
  vim.g.terminal_color_0 = c.bg
  vim.g.terminal_color_1 = c.danger
  vim.g.terminal_color_2 = c.success
  vim.g.terminal_color_3 = c.warning
  vim.g.terminal_color_4 = c.info
  vim.g.terminal_color_5 = c.tag
  vim.g.terminal_color_6 = c.type
  vim.g.terminal_color_7 = c.fg
  vim.g.terminal_color_8 = c.fg_dim
  vim.g.terminal_color_9 = c.danger
  vim.g.terminal_color_10 = c.success
  vim.g.terminal_color_11 = c.warning
  vim.g.terminal_color_12 = c.info
  vim.g.terminal_color_13 = c.tag
  vim.g.terminal_color_14 = c.type
  vim.g.terminal_color_15 = c.emphasis
end

--- Resolves 'dark' or 'light' background to the configured concrete variant.
function M.apply()
  local cfg = config.options or config.defaults()
  local bg = vim.o.background
  local variant = (bg == "light") and cfg.theme.light or cfg.theme.dark
  M.load(variant)
end

vim.api.nvim_create_user_command("QuietinkFetch", function()
  M.apply()
end, { desc = "Reload quietink highlights" })

return M
