vim.keymap.set("n", "<A-u>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<A-j>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<A-k>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<A-p>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("v", "<A-e>", "<ESC>:lua require'dap-python'.debug_selection()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: ))<CR>")
vim.keymap.set("n", "<C-Space>", ":lua require'dapui'.toggle()<CR>")
vim.keymap.set("n", "<Space><Space>", ":lua require('dap-python').test_method()<CR>")
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

local dap = require("dap")
dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		pythonPath = "/usr/local/bin/python",
		name = "Django",
		program = "${workspaceFolder}/manage.py",
		console = "externalTerminal",
		args = {"runserver", "0.0.0.0:8002"},
        django = true,
        justMyCode = false,
	},
}
