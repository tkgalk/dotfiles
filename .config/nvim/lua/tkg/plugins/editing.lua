return {
	-- Commenting/uncommenting.
	{
		"tpope/vim-commentary",
	},

	{
		"kylechui/nvim-surround",

		version = "*",
		event = "VeryLazy",
		config = true
	},

	{
		"anuvyklack/pretty-fold.nvim",

		event = "VeryLazy",
		config = true
	},

	{
		"sontungexpt/stcursorword",
		event = "VeryLazy",
		config = true,
	},

	{
		'stevearc/conform.nvim',
		opts = {
			-- formatters_by_ft = {
			-- 	go = { "gofmt" },
			-- },
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
		},
	}
}
