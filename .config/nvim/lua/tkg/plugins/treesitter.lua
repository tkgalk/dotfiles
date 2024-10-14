---@diagnostic disable: missing-fields

return {
	-- Treesitter for syntax highlighting.
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	config = function()
		local status_ok, configs = pcall(require, "nvim-treesitter.configs")
		if not status_ok then
			return
		end

		configs.setup({
			ensure_installed = {
				"luadoc",
				"markdown",
				"markdown_inline",
				"vim",
				"vimdoc",

				"bash",
				"c",
				"css",
				"dockerfile",
				"go",
				"javascript",
				"json",
				"lua",
				"python",
				"rust",
				"tsx",
				"typescript",
				"yaml",
			},
			highlight = {
				enable = true, -- false will disable the whole extension
			},
			autopairs = {
				enable = true,
			},
			indent = { enable = true, disable = { "python", "css" } },
		})
	end
}
