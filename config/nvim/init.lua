local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

require("keymaps")
require("plugins")
-- require("netberry.init").colorscheme()
vim.cmd("colorscheme retrogreen")
vim.o.background = "dark"

-- builtin autocomplete
-- vim.o.autocomplete = true
-- vim.o.complete = "o,.,w,b,u"
-- vim.o.completeopt = "fuzzy,menuone,noselect,popup"
-- vim.o.pumheight = 7
-- vim.o.pummaxwidth = 80
-- vim.opt.shortmess:prepend("c")
-- vim.api.nvim_create_autocmd("LspAttach", { command = "setlocal complete=o" })
--
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(ev)
-- 		vim.lsp.completion.enable(true, ev.data.client_id, ev.buf)
-- 	end,
-- })

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 175,
        })
    end,
})

vim.diagnostic.config({
	update_in_insert = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
    virtual_text = true,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"go"},
	callback = function(ev)
		vim.treesitter.start()
	end
})
