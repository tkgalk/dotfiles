return {
	"ThePrimeagen/git-worktree.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},

	event = "VeryLazy",

	keys = {
		{
			"<leader>gwl",
			mode = "n",
			[[<cmd>lua require("telescope").extensions.git_worktree.git_worktrees()<cr>]],
			desc = "[g]it [w]orktrees [l]ist"
		},
		{
			"<leader>gwc",
			mode = "n",
			[[<cmd>lua require("telescope").extensions.git_worktree.create_git_worktree()<cr>]],
			desc = "[g]it [w]orktree [c]reate"
		},
	}
}
