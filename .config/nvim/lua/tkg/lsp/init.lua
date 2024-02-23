local ok, _ = pcall(require, "lspconfig")
if not ok then
	return
end

require("tkg.lsp.mason")
require("tkg.lsp.handlers").setup()
require("tkg.lsp.settings.lua_ls")
