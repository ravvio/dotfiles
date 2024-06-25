local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
    return {
        desc = "nvim-tree: " .. desc, buffer = bufnr,
        noremap = true, silent = true, nowait = true
    }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '_', api.tree.change_root_to_node, opts('CD'))
    vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = true,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
        on_attach=my_on_attach,
    }


    local api = require "nvim-tree.api"

    -- custom mappings
    vim.keymap.set('n', '<leader>t', api.tree.toggle)

  end,
}
