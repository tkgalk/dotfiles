return {
	{
		"tpope/vim-fugitive",

		keys = {
			{
				"<leader>gv", mode = "n", [[<cmd>Git<cr>]], desc = "[g]it [v]iew",
			}
		}
	},

	{
		"lewis6991/gitsigns.nvim",

		dependencies = {
			"nvim-lua/plenary.nvim"
		},

		opts = {
			signs = {
				add = { hl = "GitGutterAdd", text = "┃" },
				change = { hl = "GitGutterChange", text = "┃" },
				untracked = { hl = "GitGutterChange", text = "┃" },
				delete = { hl = "GitGutterDelete", text = "_" },
				topdelete = { hl = "GitGutterDelete", text = "‾" },
				changedelete = { hl = "GitGutterChange", text = "┃" },
			},
		},

		event = "VeryLazy",

		keys = {
			{ "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "[g]it current line [b]lame" },
		}
	}
}
