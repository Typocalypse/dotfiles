local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("i", "jk", "<esc>")
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q!<CR>")
map("n", "<leader>s", ":so %<CR>")
map("n", "<leader>ev", ":tabedit $MYVIMRC<cr>")
map("n", "<leader>sv", ":source $MYVIMRC<cr>")
map("n", "<leader>dc", ":w<cr>:Telescope docker<cr>")
-- map("n", "<C-n>", "gT")
-- map("n", "<C-p>", "gt")
-- map("n", "<space>f", ":lua vim.lsp.buf.format({async = True})<cr>")
