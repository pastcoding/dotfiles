return {
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "j-hui/fidget.nvim" },
		},
		config = function()
			require("fidget").setup()
			local lsp_zero = require("lsp-zero")
			-- lsp_attach is where you enable features that only work
			-- if there is a language server active in the file
			local lsp_attach = function(_, bufnr)
				local nmap = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end

				vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
				vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { buffer = 0 })
				nmap("K", vim.lsp.buf.hover, "Hover Documentation")

				nmap("<leader>la", vim.lsp.buf.code_action, "Code [A]ction")
				nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
				nmap("gD", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", "Open Definition in Vertical Split")
				nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
				nmap("<leader>lci", vim.lsp.buf.incoming_calls, "[I]ncoming")
				nmap("<leader>lco", vim.lsp.buf.outgoing_calls, "[O]utgoing")
				nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				nmap("<leader>ld", vim.lsp.buf.type_definition, "Type [D]efinition")
				nmap("<leader>lsr", vim.lsp.buf.rename, "[R]ename")
				nmap("<leader>lsd", require("telescope.builtin").lsp_document_symbols, "[D]ocument")
				nmap("<leader>lsw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace")

				-- Lesser used LSP functionality
				nmap("<leader>lwa", vim.lsp.buf.add_workspace_folder, "[A]dd Folder")
				nmap("<leader>lwr", vim.lsp.buf.remove_workspace_folder, "[R]emove Folder")
				nmap("<leader>lwl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, "[L]ist Folders")

				-- nmap("<leader>lf", vim.lsp.buf.format, "[F]ormat Buffer")
				nmap("<leader>lf", require("conform").format, "[F]ormat Buffer")

				-- nmap("<leader>br", require("dap").toggle_breakpoint, "Toggle Breakpoint")
			end
			lsp_zero.extend_lspconfig({
				sign_text = true,
				lsp_attach = lsp_attach,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "bashls", "marksman" },
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
				},
			})
			require("lspconfig").lua_ls.setup({
				on_init = function(client)
					lsp_zero.nvim_lua_settings(client, {})
				end,
			})
		end,
	},
}
