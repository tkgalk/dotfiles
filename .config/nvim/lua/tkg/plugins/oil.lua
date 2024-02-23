return {
	"stevearc/oil.nvim",

	lazy = false,

	opts = {
		show_hidden = true,
	},

	keys = {
		{
			"-",
			mode = "n",
			[[<cmd>lua require('oil').open()<CR>]],
			desc = "project view",
		}
	},

	dependencies = { "nvim-tree/nvim-web-devicons" },
}
