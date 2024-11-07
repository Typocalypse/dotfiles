-- vim.cmd("autocmd BufNew fugitive://* lua require'config.diff'.fix_highlight()")
require("options")
require("vars")
require("lazy-config")
require("plugins")
require("autocmd")
require("config.debug")
require("config.auto_dap")
vim.cmd("set invlist")
vim.cmd("set foldmethod=indent")
-- require("telescope").load_extension "docker"
vim.cmd("nmap <C-b> [m")
vim.cmd("set colorcolumn=120")
vim.cmd("nmap <C-l> ]M")
vim.o.guifont = "RedditMono:h16"
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_fullscreen = true
-- always set ts -> tab stop at 8 
vim.cmd("set noet sts=0 ts=4")
-- vim.cmd("local set = vim.opt set.noet set.tabstop = 4 set.softtabstop = 4 set.shiftwidth = 4")
-- rsync
-- Disable virtual_text since it's redundant due to lsp_lines.
-- vim.diagnostic.config({
--   virtual_text = false,
-- })
-- vim.diagnostic.config({ virtual_lines = { only_current_line = true }})
-- vim.diagnostic.config({ virtual_lines = { highlight_whole_line = false }})
require("oil").setup()
vim.cmd("colorscheme rose-pine")
