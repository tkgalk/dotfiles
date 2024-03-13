return {
	{
		"zbirenbaum/copilot.lua",

		event = "InsertEnter",

		opts = {
			suggestion = {
				enabled = false,
			},
			panel = {
				enabled = false,
			},
		},
	},

	{
		"zbirenbaum/copilot-cmp",

		config = true,
	}
}
