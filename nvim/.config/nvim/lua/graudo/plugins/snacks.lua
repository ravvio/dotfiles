return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        dashboard = { enabled = false },
        indent = { enabled = true },
        input = { enabled = false },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = true },
        words = { enabled = false },
        git = { enabled = true },
    },
    keys = {
        { "<leader>nh",  function() Snacks.notifier.show_history() end, desc = "[N]otification [H]istory" },
        { "<leader>nd",  function() Snacks.notifier.hide() end, desc = "[N]otification [D]ismiss" },
        { "<leader>bd", function() Snacks.bufdelete() end,             desc = "Delete Buffer" },
        { "<leader>iB", function() Snacks.gitbrowse() end, desc = "G[I]t [^B]rowse", mode = { "n", "v" } },
        { "<leader>ib", function() Snacks.git.blame_line() end, desc = "G[I]t [B]lame Line" },

        { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
        { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
    },
    init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>ow")
        Snacks.toggle.diagnostics():map("<leader>od")
      end,
    })
  end,
}
