-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("graudo.core.remap")
require("graudo.core.set")
require("graudo.core.filetype")
require("graudo.core.autocmd")

require("graudo.core.git")
