return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
			vim.keymap.set(
				"n",
				"<leader>tmp",
				":MarkdownPreviewToggle<CR>",
				{ silent = true, desc = "[P]review Toggle" }
			)
			vim.keymap.set("n", "<leader>tmb", ":MarkdownPreviewStop<CR>", { silent = true, desc = "[S]top Preview" })
		end,
		ft = { "markdown" },
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		config = function()
			require("render-markdown").disable()
			vim.keymap.set(
				"n",
				"<leader>tmr",
				":RenderMarkdown toggle<CR>",
				{ silent = true, desc = "[R]ender Markdown" }
			)
		end,
	},
}
