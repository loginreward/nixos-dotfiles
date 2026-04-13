vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", function()
	vim.cmd("Explore")
end)

vim.keymap.set("n", "<leader>vca", function()
	vim.lsp.buf.code_action()
end)

vim.keymap.set("n", "<leader>vrn", function()
	vim.lsp.buf.rename()
end)
