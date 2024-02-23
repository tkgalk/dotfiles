return {
	-- Undo tree.
	"mbbill/undotree",

	keys = {
		{
			"<leader>u",
			mode = "n",
			"<cmd>UndotreeToggle<CR>",
			desc = "[u]ndo tree",
		},
	},
}

