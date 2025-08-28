return {
  "karb94/neoscroll.nvim",
  event = "WinScrolled", -- lazy-load on scroll
  config = function()
    require("neoscroll").setup({
      -- All these keys will have smooth scrolling
      mappings = { '<C-u>', '<C-d>', 'zt', 'zz', 'zb' },
      hide_cursor = true,        -- Hide cursor while scrolling
      stop_eof = true,           -- Stop at <EOF> when scrolling down
      respect_scrolloff = true,  -- Use scrolloff value
      cursor_scrolls_alone = true,
    })
  end,
}

