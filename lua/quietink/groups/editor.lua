---@param c Quietink.Palette
---@param cfg Quietink.Config
return function(c, cfg)
  local bg = cfg.transparent and "NONE" or c.bg

  return {
    Normal = { fg = c.fg, bg = bg },
    NormalFloat = { fg = c.fg, bg = cfg.transparent and "NONE" or c.bg_alt },
    NormalNC = { fg = c.fg, bg = bg },
    FloatBorder = { fg = c.border, bg = cfg.transparent and "NONE" or c.bg_alt },
    FloatTitle = { fg = c.emphasis, bg = cfg.transparent and "NONE" or c.bg_alt, bold = true },

    Cursor = { fg = c.bg, bg = c.fg },
    CursorLine = { bg = c.line },
    CursorColumn = { bg = c.line },
    CursorLineNr = { fg = c.emphasis, bold = true },
    LineNr = { fg = c.fg_dim },

    Visual = { bg = c.sel },
    VisualNOS = { bg = c.sel },
    Search = { fg = c.bg, bg = c.warning },
    IncSearch = { fg = c.bg, bg = c.func },
    CurSearch = { fg = c.bg, bg = c.func },
    Substitute = { fg = c.bg, bg = c.danger },

    ColorColumn = { bg = c.line },
    SignColumn = { fg = c.fg_dim, bg = bg },
    FoldColumn = { fg = c.fg_dim, bg = bg },
    Folded = { fg = c.fg_dim, bg = c.bg_alt },

    Pmenu = { fg = c.fg, bg = c.bg_alt },
    PmenuSel = { fg = c.emphasis, bg = c.sel, bold = true },
    PmenuSbar = { bg = c.bg_alt },
    PmenuThumb = { bg = c.border },
    PmenuKind = { fg = c.type, bg = c.bg_alt },
    PmenuKindSel = { fg = c.type, bg = c.sel },
    PmenuExtra = { fg = c.fg_dim, bg = c.bg_alt },
    PmenuExtraSel = { fg = c.fg_dim, bg = c.sel },

    StatusLine = { fg = c.fg, bg = c.bg_alt },
    StatusLineNC = { fg = c.fg_dim, bg = c.dim },
    WinSeparator = { fg = c.border },
    VertSplit = { fg = c.border },

    TabLine = { fg = c.fg_dim, bg = c.bg_alt },
    TabLineFill = { bg = c.dim },
    TabLineSel = { fg = c.emphasis, bg = c.line, bold = true },

    Title = { fg = c.emphasis, bold = true },
    Directory = { fg = c.type },
    ErrorMsg = { fg = c.danger },
    WarningMsg = { fg = c.warning },
    MoreMsg = { fg = c.info },
    Question = { fg = c.info },
    ModeMsg = { fg = c.fg },

    MatchParen = { fg = c.func, bold = true },
    NonText = { fg = c.fg_dim },
    Whitespace = { fg = c.line },
    SpecialKey = { fg = c.fg_dim },
    EndOfBuffer = { fg = c.dim },

    Conceal = { fg = c.fg_dim },
    Bold = { bold = true },
    Italic = { italic = true },

    SpellBad = { fg = c.danger, undercurl = true },
    SpellCap = { fg = c.warning, undercurl = true },
    SpellLocal = { fg = c.info, undercurl = true },
    SpellRare = { fg = c.hint, undercurl = true },

    DiffAdd = { fg = c.added, bg = c.bg_alt },
    DiffChange = { fg = c.changed, bg = c.bg_alt },
    DiffDelete = { fg = c.removed, bg = c.bg_alt },
    DiffText = { fg = c.emphasis, bg = c.sel },

    QuickFixLine = { bg = c.sel },
    WildMenu = { fg = c.emphasis, bg = c.sel },
  }
end
