local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Deprecated, update to vim.uv.fs_stat when 0.10 is stable.
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use.
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

-- Install these packages.
lazy.setup(
	"tkg.plugins",
	{
		install = {
			colorscheme = vim.g.colors_name,
		}
	}
)
