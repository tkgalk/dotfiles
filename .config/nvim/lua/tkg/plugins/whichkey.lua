return {
	-- Show possible keybindings when you start using them.
	"folke/which-key.nvim",

	config = true,

	init = function()
		local cmp_status_ok, whichkey = pcall(require, "which-key")
		if not cmp_status_ok then
			return
		end

		whichkey.register({
			["<leader>s"] = {
				name = "+search"
			},
			["<leader>h"] = {
				name = "+harpoon"
			},
			["<leader>l"] = {
				name = "+lsp"
			},
			["<leader>p"] = {
				name = "+project"
			},
			["<leader>g"] = {
				name = "+git"
			},
			["<leader>d"] = {
				name = "+diagnostics"
			},
			["<leader>b"] = {
				name = "+debugger"
			},
		})
	end
}
