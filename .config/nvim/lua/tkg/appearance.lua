local dark_theme = "tokyonight-night"
local light_theme = "tokyonight-day"

-- Theme settings.
vim.opt.termguicolors = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. dark_theme)
if not status_ok then
	vim.notify("colorscheme " .. dark_theme .. " not found!")
	return
end

-- Check if the OS is macOS or Linux.
local os = vim.loop.os_uname()

-- Set dark theme if Linux theme is dark, light otherwise.
if os.sysname == "Linux" then
	local theme = vim.fn.system("gsettings get org.gnome.desktop.interface color-scheme")
	if (string.find(theme, "schemas")) then
		return
	end

	if (string.find(theme, "prefer-dark")) then
		vim.o.background = "dark"
		vim.cmd(string.format([[colorscheme %s]], dark_theme))
	else
		vim.o.background = "prefer-light"
		vim.cmd(string.format([[colorscheme %s]], light_theme))
	end
end


-- Set dark theme if macOS theme is dark, light otherwise.
if os.sysname == "Darwin" then
	local theme = vim.fn.system("defaults read -g AppleInterfaceStyle")
	if (string.find(theme, "Dark")) then
		vim.o.background = "dark"
		vim.cmd(string.format([[colorscheme %s]], dark_theme))
	else
		vim.o.background = "light"
		vim.cmd(string.format([[colorscheme %s]], light_theme))
	end
end
