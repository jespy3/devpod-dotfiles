---@diagnostic disable: undefined-global

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)


-- Show diagnostics in a floating window under cursor
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic message" })

-- Jump to next diagnostic
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- Jump to previous diagnostic
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })

-- Show LSP hover documentation
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP hover docs" })
