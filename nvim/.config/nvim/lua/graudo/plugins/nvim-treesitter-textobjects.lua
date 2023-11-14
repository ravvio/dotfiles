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
                }
            }
        })
    end
}
