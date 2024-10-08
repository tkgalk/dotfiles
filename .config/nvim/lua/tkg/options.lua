-- :help options

-------------
-- GENERAL --
-------------

-- The encoding written to a file.
vim.opt.fileencoding = "utf-8"

-- Allows nvim to access the system clipboard.
vim.opt.clipboard = "unnamedplus"

-- Allow other programs to also edit the same file. Use persistent undo history (even after closing nvim).
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.swapfile = false
--

-- Mouse support.
vim.opt.mouse = "a"

--------
-- UI --
--------

-- Always show autocomplete menu even if only one item is present; don't select default.
vim.opt.completeopt = { "menuone", "noselect" }

-- Pop up menu height.
vim.opt.pumheight = 10

vim.opt.cmdheight = 1

-- Show line numbers.
vim.opt.number = true

-- Use relative numbers for line numbers.
vim.opt.relativenumber = true

-- Always show the sign column (column next to line numbers).
vim.opt.signcolumn = "yes"

-- Format the statuscolumn to show relative numbers and then the signcolumn (so gitsigns is on the right).
vim.opt.statuscolumn = "%=%{v:relnum?v:relnum:v:lnum} %w %s"

-------------
-- EDITING --
-------------

-- Highlight all matches on previous search pattern.
vim.opt.hlsearch = false

-- Turn on incremental search.
vim.opt.incsearch = true

-- Case insensitive search unless /C or used a capital letter in search.
vim.opt.ignorecase = true
vim.opt.smartcase = true
--

-- New lines will try to auto-indent. Wrapped lines will keep the indent level.
vim.opt.smartindent = true
vim.opt.breakindent = true
--

-- Default split behaviour: always below, always to the right.
vim.opt.splitbelow = true
vim.opt.splitright = true
--

-- Time to wait for a mapped sequence to complete (in milliseconds).
vim.opt.timeoutlen = 1000

-- Faster completion (4000ms default).
vim.opt.updatetime = 250

-- Use 4-space width tabs.
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
--

-- Line wrapping.
vim.opt.wrap = false

-- Minimum number of lines at the bottom of the screen.
vim.opt.scrolloff = 8

-- Code folding.
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldlevel = 100

-----------
-- OTHER --
-----------

-- Highlight on yank.
vim.api.nvim_exec2(
	[[
	  augroup YankHighlight
		autocmd!
		autocmd TextYankPost * silent! lua vim.highlight.on_yank()
	  augroup end
	]],
	{ output = false }
)
--

vim.opt.shortmess:append("c")

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
