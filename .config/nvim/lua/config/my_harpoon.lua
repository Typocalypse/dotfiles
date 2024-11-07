local harpoon = require("harpoon")
harpoon:setup({
	settings = {
		save_on_toggle = true,
		save_on_change = true,
		sync_on_ui_close = true,
		key = function()
			return vim.loop.cwd()
		end,
	},
})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers").new({}, {
		prompt_title = "Harpoon",
		finder = require("telescope.finders").new_table({
			results = file_paths,
		}),
		previewer = conf.file_previewer({}),
		sorter = conf.generic_sorter({}),
	}):find()
end

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add To Harpoon Window" })
vim.keymap.set("n", "<C-h>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle Quick Menu" })
--
-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
--
-- -- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() toggle_telescope(harpoon:list():prev()) end, { desc = "Previous Window" })
vim.keymap.set("n", "<C-S-N>", function() toggle_telescope(harpoon:list():next()) end, { desc = "Next Window" })