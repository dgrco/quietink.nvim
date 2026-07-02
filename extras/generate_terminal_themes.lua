-- resolve paths relative to this script's own location, not the cwd,
-- so this works whether you run it from repo root or from extras/
local script_dir = (arg[0] or ""):match("(.*/)") or "./"
package.path = package.path .. ";" .. script_dir .. "../lua/?.lua;" .. script_dir .. "../lua/?/init.lua"

local variants = { "dark", "blue", "green", "light" }

local function strip_hash(hex)
  return hex:gsub("#", "")
end

-- Map our semantic palette onto the standard ANSI 16-color model.
-- normal: black red green yellow blue magenta cyan white
-- bright: same order, brighter
local function ansi_map(c, is_light)
  return {
    normal = {
      black   = c.dim,
      red     = c.danger,
      green   = c.success,
      yellow  = c.warning,
      blue    = c.info,
      magenta = c.tag,
      cyan    = c.type,
      white   = c.fg,
    },
    bright = {
      black   = c.fg_dim,
      red     = c.danger,
      green   = c.success,
      yellow  = c.warning,
      blue    = c.info,
      magenta = c.tag,
      cyan    = c.type,
      white   = c.emphasis,
    },
  }
end

local function write_file(path, content)
  local f = assert(io.open(path, "w"))
  f:write(content)
  f:close()
  print("wrote " .. path)
end

local function gen_alacritty(variant, c)
  local a = ansi_map(c)
  local lines = {}
  local function add(s) table.insert(lines, s) end

  add("# Quietink (" .. variant .. ") for Alacritty")
  add("# Place under: ~/.config/alacritty/themes/quietink-" .. variant .. ".toml")
  add("# Then in alacritty.toml: [general] import = [\"~/.config/alacritty/themes/quietink-" .. variant .. ".toml\"]")
  add("")
  add("[colors.primary]")
  add('background = "' .. c.bg .. '"')
  add('foreground = "' .. c.fg .. '"')
  add('dim_foreground = "' .. c.fg_dim .. '"')
  add('bright_foreground = "' .. c.emphasis .. '"')
  add("")
  add("[colors.cursor]")
  add('text = "' .. c.bg .. '"')
  add('cursor = "' .. c.fg .. '"')
  add("")
  add("[colors.vi_mode_cursor]")
  add('text = "' .. c.bg .. '"')
  add('cursor = "' .. c.func .. '"')
  add("")
  add("[colors.selection]")
  add('text = "CellForeground"')
  add('background = "' .. c.sel .. '"')
  add("")
  add("[colors.search.matches]")
  add('foreground = "' .. c.bg .. '"')
  add('background = "' .. c.warning .. '"')
  add("")
  add("[colors.search.focused_match]")
  add('foreground = "' .. c.bg .. '"')
  add('background = "' .. c.func .. '"')
  add("")
  add("[colors.hints.start]")
  add('foreground = "' .. c.bg .. '"')
  add('background = "' .. c.warning .. '"')
  add("")
  add("[colors.hints.end]")
  add('foreground = "' .. c.bg .. '"')
  add('background = "' .. c.fg_dim .. '"')
  add("")
  add("[colors.normal]")
  add('black = "' .. a.normal.black .. '"')
  add('red = "' .. a.normal.red .. '"')
  add('green = "' .. a.normal.green .. '"')
  add('yellow = "' .. a.normal.yellow .. '"')
  add('blue = "' .. a.normal.blue .. '"')
  add('magenta = "' .. a.normal.magenta .. '"')
  add('cyan = "' .. a.normal.cyan .. '"')
  add('white = "' .. a.normal.white .. '"')
  add("")
  add("[colors.bright]")
  add('black = "' .. a.bright.black .. '"')
  add('red = "' .. a.bright.red .. '"')
  add('green = "' .. a.bright.green .. '"')
  add('yellow = "' .. a.bright.yellow .. '"')
  add('blue = "' .. a.bright.blue .. '"')
  add('magenta = "' .. a.bright.magenta .. '"')
  add('cyan = "' .. a.bright.cyan .. '"')
  add('white = "' .. a.bright.white .. '"')
  add("")

  return table.concat(lines, "\n")
end

local function gen_foot(variant, c)
  local a = ansi_map(c)
  local lines = {}
  local function add(s) table.insert(lines, s) end
  local function h(hex) return strip_hash(hex) end
  local section = (variant == "light") and "colors-light" or "colors-dark"

  add("# Quietink (" .. variant .. ") for foot")
  add("# Place under: ~/.config/foot/foot.ini")
  add("# Section must be named [colors-dark] or [colors-light] -- foot does not")
  add("# recognize a bare [colors] section. If you use foot's dark/light")
  add("# auto-switching, merge the relevant section(s) into one foot.ini.")
  add("# Colors are bare 6-digit hex, no '#' prefix -- this is foot's expected format.")
  add("")
  add("[" .. section .. "]")
  add("alpha=1.0")
  add("foreground=" .. h(c.fg))
  add("background=" .. h(c.bg))
  add("")
  add("cursor=" .. h(c.bg) .. " " .. h(c.fg))
  add("")
  add("regular0=" .. h(a.normal.black) .. "   # black")
  add("regular1=" .. h(a.normal.red) .. "   # red")
  add("regular2=" .. h(a.normal.green) .. "   # green")
  add("regular3=" .. h(a.normal.yellow) .. "   # yellow")
  add("regular4=" .. h(a.normal.blue) .. "   # blue")
  add("regular5=" .. h(a.normal.magenta) .. "   # magenta")
  add("regular6=" .. h(a.normal.cyan) .. "   # cyan")
  add("regular7=" .. h(a.normal.white) .. "   # white")
  add("")
  add("bright0=" .. h(a.bright.black) .. "    # bright black")
  add("bright1=" .. h(a.bright.red) .. "    # bright red")
  add("bright2=" .. h(a.bright.green) .. "    # bright green")
  add("bright3=" .. h(a.bright.yellow) .. "    # bright yellow")
  add("bright4=" .. h(a.bright.blue) .. "    # bright blue")
  add("bright5=" .. h(a.bright.magenta) .. "    # bright magenta")
  add("bright6=" .. h(a.bright.cyan) .. "    # bright cyan")
  add("bright7=" .. h(a.bright.white) .. "    # bright white")
  add("")
  add("selection-foreground=" .. h(c.emphasis))
  add("selection-background=" .. h(c.sel))
  add("")
  add("# scrollback position indicator: fg bg")
  add("scrollback-indicator=" .. h(c.fg_dim) .. " " .. h(c.bg_alt))
  add("# search box, no match: fg bg")
  add("search-box-no-match=" .. h(c.bg) .. " " .. h(c.danger))
  add("# search box, match: fg bg")
  add("search-box-match=" .. h(c.bg) .. " " .. h(c.warning))
  add("# URL highlight underline color")
  add("urls=" .. h(c.info))
  add("")

  return table.concat(lines, "\n")
end

local function gen_ghostty(variant, c)
  local a = ansi_map(c)
  local lines = {}
  local function add(s) table.insert(lines, s) end
  local function h(hex) return strip_hash(hex) end

  add("# Quietink (" .. variant .. ") for Ghostty")
  add("# Place under: ~/.config/ghostty/themes/quietink-" .. variant)
  add("# Then in ~/.config/ghostty/config: theme = quietink-" .. variant)
  add("")
  add("background = " .. h(c.bg))
  add("foreground = " .. h(c.fg))
  add("cursor-color = " .. h(c.fg))
  add("cursor-text = " .. h(c.bg))
  add("selection-background = " .. h(c.sel))
  add("selection-foreground = " .. h(c.emphasis))
  add("")
  add("palette = 0=#" .. h(a.normal.black))
  add("palette = 1=#" .. h(a.normal.red))
  add("palette = 2=#" .. h(a.normal.green))
  add("palette = 3=#" .. h(a.normal.yellow))
  add("palette = 4=#" .. h(a.normal.blue))
  add("palette = 5=#" .. h(a.normal.magenta))
  add("palette = 6=#" .. h(a.normal.cyan))
  add("palette = 7=#" .. h(a.normal.white))
  add("palette = 8=#" .. h(a.bright.black))
  add("palette = 9=#" .. h(a.bright.red))
  add("palette = 10=#" .. h(a.bright.green))
  add("palette = 11=#" .. h(a.bright.yellow))
  add("palette = 12=#" .. h(a.bright.blue))
  add("palette = 13=#" .. h(a.bright.magenta))
  add("palette = 14=#" .. h(a.bright.cyan))
  add("palette = 15=#" .. h(a.bright.white))
  add("")

  return table.concat(lines, "\n")
end

for _, variant in ipairs(variants) do
  package.loaded["quietink.palette." .. variant] = nil
  local raw = require("quietink.palette." .. variant)

  write_file(script_dir .. "alacritty/quietink-" .. variant .. ".toml", gen_alacritty(variant, raw))
  write_file(script_dir .. "foot/quietink-" .. variant .. ".ini", gen_foot(variant, raw))
  write_file(script_dir .. "ghostty/quietink-" .. variant, gen_ghostty(variant, raw))
end

print("\nDONE")
