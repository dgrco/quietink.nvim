-- Quietink: light
-- Warm paper background, ink-gray text. Same logic as dark inverted:
-- no pure black, no pure white string, one quiet dark-green accent.

---@type Quietink.Palette
return {
  bg = "#f4f2ec",
  bg_alt = "#ebe8df",
  dim = "#fbfaf6",
  line = "#e5e2d8",
  sel = "#dcd8cb",
  border = "#c8c3b3",

  fg = "#312e24",
  fg_dim = "#6b654e",
  comment = "#928c78",
  emphasis = "#1a1a15",

  keyword = "#57543f",
  func = "#2a3426",     -- darkest accent, the one "loud" element
  type = "#3e5d47",
  string = "#33623f",
  const_ = "#6e4f1f",
  punct = "#78725c",
  tag = "#344b5d",

  info = "#346088",
  hint = "#9c9683",
  warning = "#7d5417",
  danger = "#97352e",
  success = "#33713f",

  added = "#33713f",
  changed = "#7d5417",
  removed = "#97352e",
}
