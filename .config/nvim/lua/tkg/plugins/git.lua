return {
	{
		"NeogitOrg/neogit",

		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},

		keys = {
			{
				"<leader>gv", mode = "n", [[<cmd>Neogit<cr>]], desc = "[g]it [v]iew",
			},
		},

		config = true,
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
	},

	{
		"ruifm/gitlinker.nvim",

		dependencies = {
			"nvim-lua/plenary.nvim"
		},

		opts = {
			mappings = nil,
		},

		event = "VeryLazy",

		keys = {
			{ "<leader>gy", "<cmd>lua require('gitlinker').get_repo_url()<cr>", desc = "[g]it [y]ank" },
		}
	}
}
