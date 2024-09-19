vim.api.nvim_create_autocmd({ "FileType" }, {
	desc = "Easy Q",
	pattern = {
		"netrw",
		"Jaq",
		"qf",
		"git",
		"help",
		"man",
		"lspinfo",
		"spectre_panel",
		"lir",
		"DressingSelect",
		"tsplayground",
	},
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
	callback = function()
		vim.cmd("quit")
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	desc = "Checks if buffers has been changed outside of neovim since opening",
	pattern = { "*" },
	callback = function()
		vim.cmd("checktime")
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- vim.api.nvim_create_autocmd({ "FileType" }, {
-- 	pattern = { "gitcommit", "NeogitCommitMessage" },
-- 	callback = function()
-- 		vim.opt_local.wrap = true
-- 		vim.opt_local.spell = true
-- 	end,
-- })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	desc = "Linter",
	callback = function()
		local plugin_installed, lint = pcall(require, "lint")
		if plugin_installed then
			lint.try_lint()
		end
	end,
})
