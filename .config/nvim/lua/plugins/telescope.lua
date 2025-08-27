return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
	local builtin = require('telescope.builtin')

	-- Globally set hidden files and .gitignore files to show
	require('telescope').setup({
	    pickers = {
		find_files = {
		    hidden = true, -- For hidden files
		    -- no_ignore = true, -- For .gitignores
		}
	    }
	})

	-- Helpful keymaps
	vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
	vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })	
    end
}

