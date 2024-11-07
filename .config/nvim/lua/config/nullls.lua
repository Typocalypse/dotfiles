local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		-- formatting.isort,
		formatting.black.with({ extra_args = { "--line-length", "120" } }),
		-- formatting.stylua,
		-- formatting.stylua,
		-- diagnostics.trail_space,
		-- diagnostics.mypy,
		-- diagnostics.write_good,
		-- diagnostics.flake8,
		-- diagnostics.ruff,
	},
})

-- it maynot work when lsp client is attached, as lsp client may not always provide the fpormatting
