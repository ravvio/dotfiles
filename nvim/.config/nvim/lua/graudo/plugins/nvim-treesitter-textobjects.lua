return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    config = function()
        require("nvim-treesitter.configs").setup({
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
                        ["<leader>wna"] = { query = "@parameter.inner" },
                        ["<leader>wnf"] = { query = "@function.outer"  },
                    },
                    swap_previous = {
                        ["<leader>wpa"] = { query = "@parameter.inner" },
                        ["<leader>wpf"] = { query = "@function.outer"  },
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

        local ts_repeat = require("nvim-treesitter.textobjects.repeatable_movements")
        vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat.repeat_last_move)
        vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat.repeat_last_move_oppposite)

        vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat.builtin_f)
        vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat.builtin_F)
        vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat.builtin_t)
        vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat.builtin_T)
    end
}
