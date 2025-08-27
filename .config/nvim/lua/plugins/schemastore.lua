return {
    "b0o/SchemaStore.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
	local lspconfig = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	lspconfig.jsonls.setup({
	    capabilities = capabilities,
	    settings = {
		json = {
		    schemas = require("schemastore").json.schemas(),
		    validate = { enable = true },
		},
	    },
	})
    end,
}

