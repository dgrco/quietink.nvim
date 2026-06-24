---@param c Quietink.Palette
return function(c)
  return {
    -- flash.nvim
    FlashLabel = { fg = c.bg, bg = c.func, bold = true },
    FlashMatch = { fg = c.emphasis, bg = c.sel },
    FlashCurrent = { fg = c.bg, bg = c.const_, bold = true },
    FlashBackdrop = { fg = c.fg_dim },
    FlashPrompt = { fg = c.fg, bg = c.bg_alt },

    -- modes.nvim
    ModesCopy = { bg = c.const_ },
    ModesDelete = { bg = c.danger },
    ModesInsert = { bg = c.success },
    ModesVisual = { bg = c.func },

    -- dashboard-nvim
    DashboardHeader = { fg = c.type },
    DashboardCenter = { fg = c.fg },
    DashboardShortCut = { fg = c.func },
    DashboardFooter = { fg = c.fg_dim, italic = true },
    DashboardKey = { fg = c.const_ },
    DashboardDesc = { fg = c.fg },
    DashboardIcon = { fg = c.type },

    -- snacks.nvim (dashboard, input, notifier, picker)
    SnacksDashboardHeader = { fg = c.type },
    SnacksDashboardDesc = { fg = c.fg },
    SnacksDashboardKey = { fg = c.const_ },
    SnacksDashboardIcon = { fg = c.func },
    SnacksDashboardFooter = { fg = c.fg_dim, italic = true },
    SnacksDashboardTitle = { fg = c.emphasis, bold = true },

    SnacksInputNormal = { fg = c.fg, bg = c.bg_alt },
    SnacksInputBorder = { fg = c.border, bg = c.bg_alt },
    SnacksInputTitle = { fg = c.emphasis, bold = true },
    SnacksInputIcon = { fg = c.func },

    SnacksNotifierInfo = { fg = c.info },
    SnacksNotifierWarn = { fg = c.warning },
    SnacksNotifierError = { fg = c.danger },
    SnacksNotifierDebug = { fg = c.fg_dim },
    SnacksNotifierTrace = { fg = c.fg_dim },
    SnacksNotifierIconInfo = { fg = c.info },
    SnacksNotifierIconWarn = { fg = c.warning },
    SnacksNotifierIconError = { fg = c.danger },
    SnacksNotifierBorderInfo = { fg = c.info },
    SnacksNotifierBorderWarn = { fg = c.warning },
    SnacksNotifierBorderError = { fg = c.danger },

    SnacksPickerNormal = { fg = c.fg, bg = c.bg_alt },
    SnacksPickerBorder = { fg = c.border, bg = c.bg_alt },
    SnacksPickerTitle = { fg = c.emphasis, bold = true },
    SnacksPickerPreview = { fg = c.fg, bg = c.bg_alt },
    SnacksPickerMatch = { fg = c.func, bold = true },
    SnacksPickerSelected = { fg = c.const_ },
    SnacksPickerCursorLine = { bg = c.sel },
    SnacksPickerDir = { fg = c.fg_dim },
    SnacksPickerFile = { fg = c.fg },

    -- mini.statusline
    MiniStatuslineModeNormal = { fg = c.bg, bg = c.func, bold = true },
    MiniStatuslineModeInsert = { fg = c.bg, bg = c.success, bold = true },
    MiniStatuslineModeVisual = { fg = c.bg, bg = c.tag, bold = true },
    MiniStatuslineModeReplace = { fg = c.bg, bg = c.danger, bold = true },
    MiniStatuslineModeCommand = { fg = c.bg, bg = c.const_, bold = true },
    MiniStatuslineModeOther = { fg = c.bg, bg = c.type, bold = true },
    MiniStatuslineDevinfo = { fg = c.fg, bg = c.bg_alt },
    MiniStatuslineFilename = { fg = c.fg_dim, bg = c.line },
    MiniStatuslineFileinfo = { fg = c.fg, bg = c.bg_alt },
    MiniStatuslineInactive = { fg = c.fg_dim, bg = c.dim },

    -- mini.jump2d
    MiniJump2dSpot = { fg = c.bg, bg = c.func, bold = true },
    MiniJump2dSpotAhead = { fg = c.fg_dim, bg = c.bg_alt },
    MiniJump2dSpotUnique = { fg = c.bg, bg = c.const_, bold = true },
  }
end
