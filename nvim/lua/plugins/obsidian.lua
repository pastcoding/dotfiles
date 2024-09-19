-- https://github.com/epwalsh/obsidian.nvim
return {
	{
		"epwalsh/obsidian.nvim",
		lazy = true,
		event = {
			"BufReadPre " .. vim.fn.expand("~") .. "/Documents/brainy/**.md",
			"BufNewFile " .. vim.fn.expand("~") .. "/Documents/brainy/**.md",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("obsidian").setup({
				ui = { enable = false },
				workspaces = {
					{
						name = "brainy",
						path = "~/Documents/brainy",
					},
				},
			})
		end,
	},
}
