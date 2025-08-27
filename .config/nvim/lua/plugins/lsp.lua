return {
    -- LSP Config
    {
	"neovim/nvim-lspconfig",
	dependencies = {
	    "williamboman/mason.nvim",
	    "williamboman/mason-lspconfig.nvim",
	},
    },

    -- Mason to install LSPs
    {
	"williamboman/mason.nvim",
	build = ":MasonUpdate",
	config = true,
    },

    -- Mason LSP bridge
    {
	"williamboman/mason-lspconfig.nvim",
	config = function()
	    local lspconfig = require("lspconfig")
	    local capabilities = require("cmp_nvim_lsp").default_capabilities()

	    require("mason-lspconfig").setup {
		-- Auto-install these LSPs
		ensure_installed = {
		    "taplo"
		},
	    }

	    -- Setup tapo for TOML files
	    lspconfig.taplo.setup {
		capabilities = capabilities,
	    }
	end,
    },
}
