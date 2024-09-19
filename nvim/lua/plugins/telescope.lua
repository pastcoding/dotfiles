return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			lazy = true,
		},
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>.", "<cmd>lua require('telescope.builtin').fd()<cr>", desc = "Find File" },
		{ "<leader>ff", "<cmd>lua require('telescope.builtin').fd()<cr>", desc = "File" },
		{ "<leader>ft", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Text" },
		{ "<leader>fl", "<cmd>lua require('telescope.builtin').resume()<cr>", desc = "Last Search" },
		{ "<leader>fr", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", desc = "Recent Files" },
		{ "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "Help" },
		{ "<leader>fc", "<cmd>lua require('telescope.builtin').commands()<cr>", desc = "Commands" },
		{ "<leader>fk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", desc = "Keymaps" },
		{ "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "Buffers" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=always",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob=!.git/",
				},
				mappings = {
					i = {
						["jk"] = require("telescope.actions").close,
					},
					n = {
						["jk"] = require("telescope.actions").close,
						["q"] = require("telescope.actions").close,
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
			},
		})
	end,
}
