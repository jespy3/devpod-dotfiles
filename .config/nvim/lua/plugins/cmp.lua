return {
    -- Autocompletion engine
    {
	"hrsh7th/nvim-cmp",
	dependencies = {
	    "hrsh7th/cmp-nvim-lsp",  -- LSP source for cmp
	    "hrsh7th/cmp-buffer",    -- Buffer source
	    "hrsh7th/cmp-path",      -- Path source
	    "hrsh7th/cmp-cmdline",   -- Command-line source
	    "L3MON4D3/LuaSnip",      -- Snippet engine
	    "saadparwaiz1/cmp_luasnip",
	},
	config = function()
	    local cmp = require("cmp")

	    cmp.setup({
		snippet = {
		    expand = function(args)
			require("luasnip").lsp_expand(args.body)
		    end,
		},
		mapping = cmp.mapping.preset.insert({
		    ['<C-Space>'] = cmp.mapping.complete(),
		    ['<CR>'] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
		    { name = 'nvim_lsp' },
		    { name = 'luasnip' },
		}, {
			{ name = 'buffer' },
		    }),
	    })
	end,
    },
}

