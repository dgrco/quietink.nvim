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
  fg = "#c4c4c0",       -- default text
  fg_dim = "#8a8a84",   -- secondary / inactive text
  comment = "#5b5b56",  -- comments
  emphasis = "#e8e8e2", -- titles, bold UI text

  -- syntax
  keyword = "#9a9a94",   -- keywords, operators, statements
  func = "#e8e8e2",      -- functions, methods (bright, the one accent)
  type = "#8a948a",      -- types, classes, interfaces
  string = "#a8b89a",    -- strings
  const_ = "#b89a7a",    -- numbers, booleans, constants
  punct = "#7a7a74",     -- punctuation, delimiters
  tag = "#9aa8b8",       -- markup tags / attributes

  -- semantic
  info = "#8aa0b8",
  hint = "#6b6b66",
  warning = "#c2a06a",
  danger = "#c0726a",
  success = "#8aab84",

  -- diff / git
  added = "#8aab84",
  changed = "#c2a06a",
  removed = "#c0726a",
}
