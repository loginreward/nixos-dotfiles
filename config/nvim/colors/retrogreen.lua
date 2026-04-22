local colors = {
    bg = "#000000",
    fg = "#fafff9", 
    green = "#57e389",
    red = green,
    blue = green,
    darkGreen = "#1fe049",
    darkerGreen = "#159d33",
    cyan = green,
    comment = "#36403d",
    cursorline = "#2a2e2b",
    visual = "#5e6e67",
}

vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.cursorline })
vim.api.nvim_set_hl(0, "Visual", { bg = colors.cursorline })
vim.api.nvim_set_hl(0, "Search", { fg = colors.bg, bg = colors.green })
vim.api.nvim_set_hl(0, "IncSearch", { fg = colors.bg, bg = colors.green })
vim.api.nvim_set_hl(0, "StatusLine", { bg = colors.cursorline })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = colors.green })
vim.api.nvim_set_hl(0, "VertSplit", { fg = colors.cursorline })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.cursorline })
vim.api.nvim_set_hl(0, "LineNr", { fg = colors.cursorline })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.green, bold = true })
vim.api.nvim_set_hl(0, "SignColumn", { bg = colors.bg })
vim.api.nvim_set_hl(0, "Folded", { fg = colors.cursorline, bg = colors.cursorline })

vim.api.nvim_set_hl(0, "Conditional", { fg = colors.green, italic = true })
vim.api.nvim_set_hl(0, "Comment", { fg = colors.cursorline, italic = true })
vim.api.nvim_set_hl(0, "Constant", { fg = colors.green })
vim.api.nvim_set_hl(0, "String", { fg = colors.green })
vim.api.nvim_set_hl(0, "Identifier", { fg = colors.fg })
vim.api.nvim_set_hl(0, "Function", { fg = colors.darkGreen })
vim.api.nvim_set_hl(0, "Statement", { fg = colors.green })
vim.api.nvim_set_hl(0, "Type", { fg = colors.darkerGreen, bold = true })
vim.api.nvim_set_hl(0, "Special", { fg = colors.green })
vim.api.nvim_set_hl(0, "Error", { fg = colors.green, bold = true })
vim.api.nvim_set_hl(0, "Keyword", { fg = colors.green })
vim.api.nvim_set_hl(0, "Variable", { fg = colors.darkerGreen })
vim.api.nvim_set_hl(0, "Method", { fg = colors.darkerGreen })
vim.api.nvim_set_hl(0, "TSMethod", { fg = colors.darkerGreen })
vim.api.nvim_set_hl(0, "TSKeyword", { fg = colors.green })
vim.api.nvim_set_hl(0, "TSFunction", { fg = colors.darkGreen })
vim.api.nvim_set_hl(0, "TSVariable", { fg = colors.darkerGreen })
vim.api.nvim_set_hl(0, "TSType", { fg = colors.darkerGreen })

vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = colors.cursorline })
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = colors.cursorline, bg = colors.cursorline })
vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { fg = colors.bg, bg = colors.green })
vim.api.nvim_set_hl(0, "BlinkCmpLabel", { fg = colors.fg })
vim.api.nvim_set_hl(0, "BlinkCmpLabelDetail", { fg = colors.cursorline })
vim.api.nvim_set_hl(0, "BlinkCmpLabelDescription", { fg = colors.cursorline })
vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { fg = colors.darkGreen, bold = true })
vim.api.nvim_set_hl(0, "BlinkCmpKind", { fg = colors.green })
vim.api.nvim_set_hl(0, "BlinkCmpDoc", { fg = colors.fg, bg = colors.cursorline })
vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = colors.cursorline, bg = colors.cursorline })
