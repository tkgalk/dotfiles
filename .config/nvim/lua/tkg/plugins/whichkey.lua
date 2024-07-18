return {
	-- Show possible keybindings when you start using them.
	"folke/which-key.nvim",

	event = "VeryLazy",

	opts = {
		preset = "helix",
		icons = {
			rules = false,
		},
		spec = {
			{ "<leader>s", group = "search" },
			{ "<leader>h", group = "harpoon" },
			{ "<leader>l", group = "lsp" },
			{ "<leader>p", group = "project" },
			{ "<leader>g", group = "git" },
			{ "<leader>d", group = "diagnostics" },
			{ "<leader>b", group = "debugger" },
		},
	},

	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "buffer local keymaps (which-key)",
		}
	},
}
