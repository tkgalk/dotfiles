return {
	{
		"mfussenegger/nvim-dap",

		keys = {
			{
				"<leader>bc",
				mode = "n",
				[[<cmd>lua require('dap').continue()<cr>]],
				desc = "de[b]ugger [c]ontinue",
			},
			{
				"<leader>bb",
				mode = "n",
				[[<cmd>lua require('dap').toggle_breakpoint()<cr>]],
				desc = "de[b]ugger toggle [b]reakpoint",
			},
			{
				"<leader>bl",
				mode = "n",
				[[<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>]],
				desc = "de[b]ugger toggle [b]reakpoint",
			},
			{
				"<leader>bi",
				mode = "n",
				[[<cmd>lua require('dap').step_into()<cr>]],
				desc = "de[b]ugger step [i]nto",
			},
			{
				"<leader>bo",
				mode = "n",
				[[<cmd>lua require('dap').step_over()<cr>]],
				desc = "de[b]ugger step [o]ver",
			},
		},
	},

	{
		"leoluz/nvim-dap-go",

		config = true,
		dependencies = { "mfussenegger/nvim-dap" },

		keys = {
			{
				"<leader>bt",
				mode = "n",
				[[<cmd>lua require('dap-go').debug_test()<cr>]],
				desc = "de[b]ugger debug [t]est",
			},
		},
	},

	{
		"rcarriga/nvim-dap-ui",

		config = true,
		dependencies = { "mfussenegger/nvim-dap" },

		keys = {
			{
				"<leader>bv",
				mode = "n",
				[[<cmd>lua require('dapui').toggle()<cr>]],
				desc = "de[b]ugger [v]iew",
			},
		},
	}
}
