return {
	-- Navigation plugin for jumping between buffers.
	"ThePrimeagen/harpoon",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	event = "VeryLazy",

	opts = {
		tabline = false,
		tabline_prefix = " ",
		tabline_suffix = " "
	},

	keys = {
		{
			"<leader>hu",
			mode = "n",
			[[<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>]],
			desc = "[h]arpoon [u]i",
		},
		{
			"<leader>ha",
			mode = "n",
			[[<cmd>lua require('harpoon.mark').add_file()<CR>]],
			desc = "[h]arpoon [a]dd",
		},
		{
			"<leader>h1",
			mode = "n",
			[[<cmd>lua require('harpoon.ui').nav_file(1)<CR>]],
			desc = "[h]arpoon [1] file",
		},
		{
			"<leader>h2",
			mode = "n",
			[[<cmd>lua require('harpoon.ui').nav_file(2)<CR>]],
			desc = "[h]arpoon [2] file",
		},
		{
			"<leader>h3",
			mode = "n",
			[[<cmd>lua require('harpoon.ui').nav_file(3)<CR>]],
			desc = "[h]arpoon [3] file",
		},
		{
			"<leader>h4",
			mode = "n",
			[[<cmd>lua require('harpoon.ui').nav_file(4)<CR>]],
			desc = "[h]arpoon [4] file",
		},
		{
			"<leader>h5",
			mode = "n",
			[[<cmd>lua require('harpoon.ui').nav_file(5)<CR>]],
			desc = "[h]arpoon [5] file",
		},
		{
			"<leader>h6",
			mode = "n",
			[[<cmd>lua require('harpoon.ui').nav_file(6)<CR>]],
			desc = "[h]arpoon [4] file",
		},
	},
}
