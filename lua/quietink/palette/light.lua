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

  fg = "#3a382f",
  fg_dim = "#726d5c",
  comment = "#928c78",
  emphasis = "#201f1a",

  keyword = "#5f5c4c",
  func = "#2f3a2a",     -- darkest accent, the one "loud" element
  type = "#4a6552",
  string = "#3e6b4a",
  const_ = "#7a5a28",
  punct = "#85806e",
  tag = "#3f5566",

  info = "#3f6a92",
  hint = "#9c9683",
  warning = "#8a5f1e",
  danger = "#a13f38",
  success = "#3e7a4a",

  added = "#3e7a4a",
  changed = "#8a5f1e",
  removed = "#a13f38",
}
