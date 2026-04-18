vim.pack.add({
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/morhetz/gruvbox",
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.lsp.enable("lua_ls")
vim.lsp.enable("gopls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("hls")
vim.lsp.config["qmlls"] = {
	cmd = { "qmlls6" },
	filetypes = { "qml" },
	root_markers = { ".git" },
}
vim.lsp.enable("qmlls")
vim.lsp.enable("clangd")
vim.lsp.enable("ty")
vim.lsp.enable("pyright")
vim.lsp.enable("superhtml")
vim.lsp.enable("harper_ls")
vim.lsp.enable("astro")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("ols")
vim.lsp.enable("nil_ls")
vim.lsp.enable("zls")

require("blink.cmp").setup({
    keymap = {
        preset = "default",
    },

    appearance = {
        nerd_font_variant = "mono"
    },

    completion = { documentation = { auto_show = true } },

    sources = {
        default = { "lsp", "path", "snippets" },
    },
    -- opts_extend = { "sources.default" },

    fuzzy = { implementation = "lua" },
})

-- require("gruvbox").setup({
--     terminal_colors = true, -- add neovim terminal colors
--     undercurl = true,
--     underline = false,
--     bold = true,
--     italic = {
--         strings = false,
--         emphasis = false,
--         comments = false,
--         operators = false,
--         folds = false,
--     },
--     strikethrough = true,
--     invert_selection = false,
--     invert_signs = false,
--     invert_tabline = false,
--     invert_intend_guides = false,
--     inverse = true, -- invert background for search, diffs, statuslines and errors
--     contrast = "", -- can be "hard", "soft" or empty string
--     palette_overrides = {},
--     overrides = {},
--     dim_inactive = false,
--     transparent_mode = false,
-- })

-- local transparent = false -- set to true if you would like to enable transparency
--
-- local bg = "#011628"
-- local bg_dark = "#011423"
-- local bg_highlight = "#143652"
-- local bg_search = "#0A64AC"
-- local bg_visual = "#275378"
-- local fg = "#CBE0F0"
-- local fg_dark = "#B4D0E9"
-- local fg_gutter = "#627E97"
-- local border = "#547998"

-- require("tokyonight").setup({
--     style = "night",
--     transparent = transparent,
--     styles = {
--         sidebars = transparent and "transparent" or "dark",
--         floats = transparent and "transparent" or "dark",
--     },
--     on_colors = function(colors)
--         colors.bg = bg
--         colors.bg_dark = transparent and colors.none or bg_dark
--         colors.bg_float = transparent and colors.none or bg_dark
--         colors.bg_highlight = bg_highlight
--         colors.bg_popup = bg_dark
--         colors.bg_search = bg_search
--         colors.bg_sidebar = transparent and colors.none or bg_dark
--         colors.bg_statusline = transparent and colors.none or bg_dark
--         colors.bg_visual = bg_visual
--         colors.border = border
--         colors.fg = fg
--         colors.fg_dark = fg_dark
--         colors.fg_float = fg
--         colors.fg_gutter = fg_gutter
--         colors.fg_sidebar = fg_dark
--     end,
-- })
