return {
	-- Diagnostics and problems.
	"folke/trouble.nvim",

	opts = {
		indent_lines = false,
	},

	keys = {
		{ "<leader>dt", "<cmd>TroubleToggle<cr>", desc = "[d]iagnostics [t]oggle" }
	}
}
