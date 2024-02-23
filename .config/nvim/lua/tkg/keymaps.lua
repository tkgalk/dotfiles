------------
-- LEADER --
------------

-- Use Space as the leader key. Other keybindings will work off of <leader>.
--
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--

------------
-- NORMAL --
------------

-- Window navigation. Instead of "<C-w>h", use "<C-h>" et cetera.
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
--

-- Make sure moving with C-d and C-u keeps the cursor in the middle.
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
--

-- Make sure searching terms keeps the cursor in the middle.
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true })
--

-- Get rid of <Q>.
vim.keymap.set("n", "Q", "<nop>", { noremap = true, silent = true })

-- Resize current window using arrows.
vim.keymap.set("n", "<A-Up>", ":resize +2<CR>", { noremap = true, silent = true }, "Resize Horizontal +")
vim.keymap.set("n", "<A-Down>", ":resize -2<CR>", { noremap = true, silent = true }, "Resize Horizontal -")
vim.keymap.set("n", "<A-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true }, "Resize Vertical +")
vim.keymap.set("n", "<A-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true }, "Resize Verital -")
--

-- Switch between next and previous buffer.
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true }, "Next Buffer")
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { noremap = true, silent = true }, "Previous Buffer")
--

-- Open Telescope file-switcher. [File]. [Search File]. [Search Tags].
vim.keymap.set(
	"n",
	"<leader>sf",
	"<cmd>lua require('telescope.builtin').find_files()<CR>",
	{ noremap = true, silent = true, desc = "[s]earch [f]iles" }
)
vim.keymap.set(
	"n",
	"<leader>sg",
	"<cmd>lua require('telescope.builtin').live_grep()<CR>",
	{ noremap = true, silent = true, desc = "[s]earch [g]rep" }
)
vim.keymap.set(
	"n",
	"<leader>st",
	"<cmd>lua require('telescope.builtin').tags()<CR>",
	{ noremap = true, silent = true, desc = "[s]earch [t]ags" }
)
--

------------
-- VISUAL --
------------

-- Stay in indent mode after indenting a block of code.
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
--

-- Use persistent yank (yank won't be overwritten by whatever you copied over).
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true })

-- Move lines around.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
--
