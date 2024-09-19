return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")
			wk.add({
				{ "<leader>t", icon = "󰓩", group = "[T]ab / [T]oggle" },
				{ "<leader>tm", icon = "󰓩", group = "[M]arkdown" },
				{ "<leader>b", icon = "", group = "[B]uffers" },
				{ "<leader>f", icon = "", group = "[F]ind (Telesope)" },
				{ "<leader>s", icon = "", group = "[S]ession" },
				{ "<leader>l", icon = "", group = "[L]SP" },
				{ "<leader>lc", icon = "", group = "[C]alls" },
				{ "<leader>ls", icon = "", group = "[S]ymbols" },
				{ "<leader>lw", icon = "", group = "[W]orkspace" },
				{ "<leader>g", icon = "", group = "[G]it" },
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup()
		end,
	},
	{
		-- colorizer
		"NvChad/nvim-colorizer.lua",
		config = function()
			local wk = require("which-key")
			wk.add({
				{ "<leader>tz", "<cmd>ColorizerToggle<CR>", desc = "Toggle Colori[Z]er" },
			})
			require("colorizer").setup()
		end,
	},

	{
		-- highlight todo comment
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
