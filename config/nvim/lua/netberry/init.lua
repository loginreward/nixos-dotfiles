local M = {};

local colors = {
    bg      = "#1a1b26",
    gray1   = "#313435",
    gray2   = "#989ea0",
    gray3   = "#686d6e",
    fg      = "#eff4f6",
    red     = "#d85f5f",
    orange  = "#ff8d70",
    yellow  = "#e6e84f",
    green   = "#9df07a",
    blue1   = "#a3e5ff",
    blue2   = "#a3c0ff",
    purple  = "#c383f1",
    purple2 = "#b17af0",
}

function M.colorscheme()
    vim.cmd("highlight clear")
    vim.cmd("syntax reset")

    vim.o.background = "dark";
    vim.g.colors_name = "netberry";

    vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.gray1 })
    vim.api.nvim_set_hl(0, "Visual", { bg = colors.gray3 })
    vim.api.nvim_set_hl(0, "Search", { fg = colors.bg, bg = colors.orange })
    vim.api.nvim_set_hl(0, "IncSearch", { fg = colors.bg, bg = colors.orange })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = colors.gray2 })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = colors.orange })
    vim.api.nvim_set_hl(0, "VertSplit", { fg = colors.gray8 })
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.gray8 })
    vim.api.nvim_set_hl(0, "LineNr", { fg = colors.gray6 })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.orange, bold = true })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = colors.bg })
    vim.api.nvim_set_hl(0, "Folded", { fg = colors.gray8, bg = colors.gray3 })

    vim.api.nvim_set_hl(0, "Comment", { fg = colors.gray3, italic = true })
    vim.api.nvim_set_hl(0, "Constant", { fg = colors.red })
    vim.api.nvim_set_hl(0, "String", { fg = colors.green })
    vim.api.nvim_set_hl(0, "Identifier", { fg = colors.purple2 })
    vim.api.nvim_set_hl(0, "Function", { fg = colors.purple2 })
    vim.api.nvim_set_hl(0, "Statement", { fg = colors.red })
    vim.api.nvim_set_hl(0, "Type", { fg = colors.red, bold = true })
    vim.api.nvim_set_hl(0, "Special", { fg = colors.orange })
    vim.api.nvim_set_hl(0, "Error", { fg = colors.red, bold = true })
    vim.api.nvim_set_hl(0, "Keyword", { fg = colors.blue2 })
    vim.api.nvim_set_hl(0, "Variable", { fg = colors.fg })
    vim.api.nvim_set_hl(0, "TSKeyword", { fg = colors.orange })
    vim.api.nvim_set_hl(0, "TSFunction", { fg = colors.purple2 })
    vim.api.nvim_set_hl(0, "TSVariable", { fg = colors.fg })
    vim.api.nvim_set_hl(0, "TSType", { fg = colors.red })

    vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = colors.gray1 })
    vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = colors.gray3, bg = colors.gray1 })
    vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { fg = colors.bg, bg = colors.blue2 })
    vim.api.nvim_set_hl(0, "BlinkCmpLabel", { fg = colors.fg })
    vim.api.nvim_set_hl(0, "BlinkCmpLabelDetail", { fg = colors.gray2 })
    vim.api.nvim_set_hl(0, "BlinkCmpLabelDescription", { fg = colors.gray3 })
    vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { fg = colors.purple, bold = true })
    vim.api.nvim_set_hl(0, "BlinkCmpKind", { fg = colors.blue2 })
    vim.api.nvim_set_hl(0, "BlinkCmpDoc", { fg = colors.fg, bg = colors.gray2 })
    vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = colors.gray3, bg = colors.gray2 })

    if package.loaded["lualine"] then
        require("lualine").setup({
            options = { theme = "netberry" },
        })
    end
end

return M
