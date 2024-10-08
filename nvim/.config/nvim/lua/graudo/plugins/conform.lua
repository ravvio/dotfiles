return {
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = false,
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      -- python = { "isort", "black" },
      -- Use a sub-list to run only the first available formatter
      -- javascript = { { "prettierd", "prettier" } },
      -- typescript = { { "prettierd", "prettier" } },
    },
  }
}
