require("lazy").setup({
	------------------------------------------------
	------------------------------------------------
	"ggandor/lightspeed.nvim", --lightspeed
	------------------------------------------------
	------------------------------------------------
	--
	"airblade/vim-rooter", -- set root dir
	-- lsp releated i.e. used in development
	"hrsh7th/cmp-nvim-lsp",
	{
		"hrsh7th/nvim-cmp",
		-- load cmp on InsertEnter
		event = "InsertEnter",
		-- these dependencies will only be loaded when cmp loads
		-- dependencies are always lazy-loaded unless specified otherwise
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"onsails/lspkind.nvim",
			"windwp/nvim-autopairs",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"petertriho/cmp-git",
			"rcarriga/cmp-dap"
		},
		config = function()
			require("config.cmp")
		end,
	},
	------------------------------------------------
	------------------------------------------------
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			require("config.lsp")
		end,
	},

	-- NERD TREE --
	-- nerd tree setup and keymaps
	{
		"preservim/nerdtree",
		lazy = true,
		keys = {
			{ "<space>o", "<cmd>NERDTree<cr>",       desc = "Nerd Tree Open" },
			{ "<space>k", "<cmd>NERDTreeClose<cr>",  desc = "Nerd Tree Close" },
			{ "<space>t", "<cmd>NERDTreeToggle<cr>", desc = "Nerd Tree Toggle" },
			{ "<space>s", "<cmd>NERDTreeFind<cr>",   desc = "Nerd Tree Find" },
			-- { "<space>f", "<cmd>NERDTreeFocus<cr>",  desc = "Nerd Tree Focus" },
			{ "<space>m", "<cmd>NERDTreeMirror<cr>", desc = "Nerd Tree Mirrion to new tab" },
		},
		config = function()
			vim.g.NERDTreeWinPos = "right"
		end,
	},
	------------------------------------------------
	------------------------------------------------

	{
		"windwp/nvim-autopairs",
		lazy = true,
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	------------------------------------------------
	------------------------------------------------
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup()
		end,
	},
	------------------------------------------------
	------------------------------------------------
	"nvim-lua/plenary.nvim",
	-------------------------------------------------
	-------------------------------------------------
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("config.mason")
		end,
	},
	-------------------------------------------------
	-------------------------------------------------
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("config.nullls")
		end,
	},
	-------------------------------------------------
	-------------------------------------------------
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("config.toggleterm")
		end,
	},
	------------------------------------------------
	------------------------------------------------
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		tag = "0.1.2",
		dependencies = {
			{ "nvim-lua/plenary.nvim",            "nvim-telescope/telescope-live-grep-args.nvim" },
			{ "nvim-telescope/telescope-dap.nvim" },
		},
		keys = {
			{ "<C-f>", "<cmd>lua require('telescope.builtin').find_files()<cr>",                       desc = "Find files" },
			{ "<C-g>", "<cmd>lua require('telescope.builtin').git_files()<cr>",                        desc = "Find git files" },
			{ "<C-i>", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", desc = "Live grep Args" },
			-- { "<C-b>", "<cmd>lua require('telescope.builtin').buffers()<cr>",    desc = "List buffers" },
			{
				"<C-s>",
				"<cmd>lua require('telescope.builtin').grep_string()<cr>",
				desc = "Grep string under the cursor",
			},
			{
				"<C-d>",
				"<cmd>lua require('telescope.builtin').diagnostics({bufnr = 0})<cr>",
				desc = "View diagnostics",
			},
			{
				"<C-c>",
				"<cmd>lua require('telescope.builtin').default_mappings.actions.close()<cr>",
				desc = "View diagnostics",
			},
			{
				"<C-e>",
				"<cmd>lua require('telescope-live-grep-args.actions').quote_prompt()",
				-- ["<C-a>"] = lga_actions.quote_prompt(), -- quote_prompt log -> 'servicelog'
				desc = "View diagnostics",
			},
			--     {"jk", "<esc>"}
		},
		config = function()
			-- local lga_actions = require("telescope-live-grep-args.actions")
			local lga_actions = require("telescope-live-grep-args.actions")
			require("telescope").load_extension("dap")
			require("telescope").load_extension("live_grep_args")
			require("telescope").setup({
				preview = {
					treesitter = false,
				},
				pickers = {
					colorscheme = {
						enable_preview = true
					}
				},
				extensions = {
					-- NOTE: this setup is optional
					live_grep_args = {
						auto_quoting = true, -- enable/disable auto-quoting
						-- define mappings, e.g.
						mappings = { -- extend mappings
							i = {
								["<C-a>"] = lga_actions.quote_prompt(), -- quote_prompt log -> 'servicelog'
								-- ["<C-a>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
								-- ["<C-space>"] = lga_actions.to_fuzzy_refine,
							},
						},
					},
				},
			})
		end,
	},
	------------------------------------------------
	------------------------------------------------
	------------------------------------------------
	------------------------------------------------
	{
		"junegunn/fzf.vim",
		lazy = true,
		dependencies = { "junegunn/fzf", run = ":call fzf#install()" },
	},
	------------------------------------------------
	------------------------------------------------
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		config = function()
			require("lualine").setup({
				options = {
					globalstatus = true,
				},
			})
		end,
	},
	------------------------------------------------
	------------------------------------------------
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_install = "all",
				auto_install = true,
				highlight = {
					enable = true,
				},
				indent = {
					enable = false,
				},
				-- disable = { "javascript", },
				additional_vim_regex_highlighting = false,
			})
		end,
	},
	------------------------------------------------
	------------------------------------------------
	------------------------------------------------
	------------------------------------------------
	{ "tpope/vim-fugitive" },
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	{ "mfussenegger/nvim-dap" },
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			require("config/dapconfig")
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			require("dap-python").setup("python")
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup({
				enabled = true, -- enable this plugin (the default)
				enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
				highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
				highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
				show_stop_reason = true, -- show stop reason when stopped for exceptions
				commented = false, -- prefix virtual text with comment string
				only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
				all_references = false, -- show virtual text on all all references of the variable (not only definitions)
				clear_on_continue = false, -- clear virtual text on "continue" (might cause flickering when stepping)
				display_callback = function(variable, buf, stackframe, node, options)
					if options.virt_text_pos == "inline" then
						return " = " .. variable.value
					else
						return variable.name .. " = " .. variable.value
					end
				end,
				-- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
				virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",

				-- experimental features:
				all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
				virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
				virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
				-- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
			})
		end,
	},

	{
		"f-person/git-blame.nvim",
		config = function()
			require("gitblame").setup({})
		end,
	},

	-- { "nvim-neotest/neotest-python" },
	-- {
	-- 	"nvim-neotest/neotest",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"antoinemadec/FixCursorHold.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("neotest").setup({
	-- 			adapters = {
	-- 				require("neotest-python")({
	-- 					runner = "pytest",
	-- 					args = { "--log-level", "DEBUG" },
	-- 				}),
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("octo").setup({})
		end,
	},
	{ "folke/neodev.nvim",          opts = {} },
	{
		'LiadOz/nvim-dap-repl-highlights',
		config = function()
			require('nvim-dap-repl-highlights').setup()
		end
	},

	-- {
	-- 	"kdheepak/lazygit.nvim",
	-- 	-- optional for floating window border decoration
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- },
	{
		"tamton-aquib/duck.nvim",
		config = function()
			vim.keymap.set('n', '<leader>dd', function() require("duck").hatch("ඞ") end, {})
			vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
			vim.keymap.set('n', '<leader>da', function() require("duck").cook_all() end, {})
		end
	},
	{
		"mcchrish/zenbones.nvim",
		dependencies = {
			"rktjmp/lush.nvim",
		},
	},
	{ "ryanoasis/vim-devicons" },
	{ "nvim-tree/nvim-web-devicons" },
	{
		'stevearc/oil.nvim',
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{"https://gitlab.com/schrieveslaach/sonarlint.nvim", lazy=false},
	{ "rose-pine/neovim", name = "rose-pine" },
	{"iamcco/coc-spell-checker"}

})
