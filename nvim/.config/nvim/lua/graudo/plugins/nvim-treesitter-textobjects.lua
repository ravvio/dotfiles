return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    lazy = false,
    init = function()
         vim.g.no_plugin_maps = true
    end,
    config = function()
        require("nvim-treesitter-textobjects").setup({
            textobjects = {
                select = {
                    enable = true,
                    -- jump to next automatically
                    lookahead = true,

                    keymaps = {
                        ["a="] = { query = "@assignment.outer" },
                        ["i="] = { query = "@assignment.inner" },
                        ["l="] = { query = "@assignment.lhs"   },
                        ["r="] = { query = "@assignment.rhs"   },

                        ["aa"] = { query = "@parameter.outer"  },
                        ["ia"] = { query = "@parameter.inner"  },

                        ["ai"] = { query = "@conditional.outer"},
                        ["ii"] = { query = "@conditional.inner"},

                        ["al"] = { query = "@loop.outer"      },
                        ["il"] = { query = "@loop.inner"      },

                        ["af"] = { query = "@function.outer"  },
                        ["if"] = { query = "@function.inner"  },

                        ["ak"] = { query = "@call.outer"      },
                        ["ik"] = { query = "@call.inner"      },

                        ["ac"] = { query = "@class.outer"     },
                        ["ic"] = { query = "@class.inner"     },
                    }
                },

                swap = {
                    enable = true,

                    swap_next = {
                        ["<leader>wna"] = "@parameter.inner",
                        ["<leader>wnf"] = "@function.outer",
                    },
                    swap_previous = {
                        ["<leader>wpa"] = "@parameter.inner",
                        ["<leader>wpf"] = "@function.outer",
                    },
                },

                move = {
                    enable = true,
                    set_jupms = true,

                    goto_next_start = {
                        ["]i"] = { query = "@conditional.outer" },
                        ["]f"] = { query = "@function.outer"    },
                        ["]c"] = { query = "@class.outer"       },
                        ["]l"] = { query = "@loop.outer"        },
                        ["]k"] = { query = "@call.outer"        },
                    },

                    goto_next_end = {
                        ["]I"] = { query = "@conditional.outer" },
                        ["]F"] = { query = "@function.outer"    },
                        ["]C"] = { query = "@class.outer"       },
                        ["]L"] = { query = "@loop.outer"        },
                        ["]K"] = { query = "@call.outer"        },
                    },

                    goto_previous_start = {
                        ["[i"] = { query = "@conditional.outer" },
                        ["[f"] = { query = "@function.outer"    },
                        ["[c"] = { query = "@class.outer"       },
                        ["[l"] = { query = "@loop.outer"        },
                        ["[k"] = { query = "@call.outer"        },
                    },

                    goto_previous_end = {
                        ["[I"] = { query = "@conditional.outer" },
                        ["[F"] = { query = "@function.outer"    },
                        ["[C"] = { query = "@class.outer"       },
                        ["[L"] = { query = "@loop.outer"        },
                        ["[K"] = { query = "@call.outer"        },
                    }
                }
            }
        })

        local ts_repeat = require("nvim-treesitter-textobjects.repeatable_move")
        vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat.repeat_last_move_next)
        vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat.repeat_last_move_previous)

        vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat.builtin_f_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat.builtin_F_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat.builtin_t_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat.builtin_T_expr, { expr = true })
    end
}
