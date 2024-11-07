-- # what is i try to add g to all its keymap
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = function(client, bufnr)
	if client.name == "pyright" then
		client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
		-- client.server_capabilities.publishDiagnosticsss = false
	end
	if client.name == "pylsp" then
		client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
	end
	-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
	-- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
	-- vim.keymap.set("n", "gr", vim.lsp.buf.rename, { buffer = 0 })
	-- send document hightlight request to all server
end

require("lspconfig")["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		python = {
			analysis = {
				maxLineLength = 120, -- Set your desired line length
				typeCheckingMode = "off"
			},
		},
	},
})
require("lspconfig")["tsserver"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
require("lspconfig")["clangd"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

require("lspconfig")["pylsp"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		pylsp = {
			plugins = {
				ruff = {
					select = { "W", "E", "F", "C90", "I", "N", "YTT", "S", "FBT", "B", "DJ", "T20",
						"Q", "PL", "TID",
						"SIM",
						"SLOT", "SLF", "RET", "RSE", "W", "E" },
					ignore = { "W191", "D407", "D408", "D409", "D410", "D411", "D107", "PLR2004", "S101", "E501" },
					maxLineLength = 120,
				},
				maxLineLength = 120,
			},
			maxLineLength = 120,
		},
	},
})





require("lspconfig").rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true
			},
		}
	}
})
require("lspconfig")["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		diagnostics = {
			globals = { "vim" },
		},
	},
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

require('sonarlint').setup({
   server = {
      cmd = {
         'sonarlint-language-server',
         -- Ensure that sonarlint-language-server uses stdio channel
         '-stdio',
         '-analyzers',
         -- paths to the analyzers you need, using those for python and java in this example
         vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
         vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
         vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
      }
   },
   filetypes = {
      -- Tested and working
      'python',
      'cpp',
      'java',
   }
})

