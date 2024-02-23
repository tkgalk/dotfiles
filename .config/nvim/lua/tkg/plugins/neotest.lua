return {
	"nvim-neotest/neotest",

	dependencies = {
		"nvim-neotest/neotest-go",
		-- Your other test adapters here
	},

	config = function()
		-- get neotest namespace (api call creates or returns namespace)
		local neotest_ns = vim.api.nvim_create_namespace("neotest")

		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					local message =
						diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
					return message
				end,
			},
		}, neotest_ns)

		require("neotest").setup({
			-- your neotest config here
			adapters = {
				require("neotest-go")({
					experimental = {
						test_table = false,
					},
					args = { "-timeout=60s" },
				}),
			},
		})
	end,

	keys = {
		{ "<leader>tv", "<cmd>Neotest summary<cr>", desc = "[t]est [v]iew" },
		{ "<leader>to", "<cmd>Neotest output<cr>", desc = "[t]est [o]utput" },
		{ "<leader>tc", function() require("neotest").run.run() end, desc = "[t]est [c]ursor" },
		{ "<leader>tf", function() require('neotest').run.run(vim.fn.expand('%')) end, desc = "[t]est [f]ile" },
	}
}
