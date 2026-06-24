-- Quietink: dark
-- Near-black neutral base. One bright accent reserved for functions/emphasis.
-- Strings are a muted sage-gray, never pure white.

---@type Quietink.Palette
return {
  -- core surfaces
  bg = "#121212",      -- editor background
  bg_alt = "#1a1a1a",  -- floats, popups, sidebars
  dim = "#0a0a0a",     -- inactive splits, statusline fill
  line = "#1e1e1e",    -- cursorline
  sel = "#262626",     -- visual selection
  border = "#3a3a36",  -- window borders, separators

  -- text
  fg = "#d2d2cb",       -- default text
  fg_dim = "#9b9b8d",   -- secondary / inactive text
  comment = "#5b5b56",  -- comments
  emphasis = "#efefeb", -- titles, bold UI text

  -- syntax
  keyword = "#aaaa9d",   -- keywords, operators, statements
  func = "#efefeb",      -- functions, methods (bright, the one accent)
  type = "#93a493",      -- types, classes, interfaces
  string = "#b5c5a6",    -- strings
  const_ = "#c4a787",    -- numbers, booleans, constants
  punct = "#8f8f82",     -- punctuation, delimiters
  tag = "#a6b5c5",       -- markup tags / attributes

  -- semantic
  info = "#97adc5",
  hint = "#6b6b66",
  warning = "#cdac78",
  danger = "#cb8078",
  success = "#96b990",

  -- diff / git
  added = "#96b990",
  changed = "#cdac78",
  removed = "#cb8078",
}
