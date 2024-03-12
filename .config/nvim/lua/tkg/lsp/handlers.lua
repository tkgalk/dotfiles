local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = true,
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_keymaps()
	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true, desc = "Hover Tooltip" })

	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true, desc = "[G]o to [D]eclaration" })
	vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, { noremap = true, silent = true, desc = "[G]o to [d]efinitions" })
	vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations, { noremap = true, silent = true, desc = "[G]o to [I]mplementations" })
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { noremap = true, silent = true, desc = "[G]o to [r]eferences" })
	vim.keymap.set("n", "<leader>k", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true, desc = "Show Diagnostic Bubble" })
	vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", { noremap = true, silent = true, desc = "[f]ormat" })
	vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { noremap = true, silent = true, desc = "Code [a]ction" })
	vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { noremap = true, silent = true, desc = "[r]ename" })
	vim.keymap.set("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true, desc = "Show [s]ignature" })

	vim.keymap.set("n", "<leader>dj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", { noremap = true, silent = true, desc = "next [d]iagnostic" })
	vim.keymap.set("n", "<leader>dk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", { noremap = true, silent = true, desc = "previous [d]iagnostic" })
end

M.on_attach = function(client)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end

	lsp_keymaps()
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

return M
