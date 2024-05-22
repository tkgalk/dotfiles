local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = "+", modified = "~", removed = "-" }, -- changes diff symbols
	cond = hide_in_width,
}

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

local filename = {
	"filename",
	path = 1,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

return {
	-- Show a status bar at the bottom.
	"nvim-lualine/lualine.nvim",

	opts = {
		options = {
			icons_enabled = true,
			theme = vim.g.colors_name,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
			always_divide_middle = true,
			globalstatus = true,
		},
		sections = {
			lualine_a = { mode },
			lualine_b = { branch, diff },
			lualine_c = { filename },
			lualine_x = {},
			lualine_y = {},
			lualine_z = { diagnostics },
		},
		inactive_sections = {
			lualine_a = { filename },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		}
	}
}
