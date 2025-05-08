return {
    {
        -- this will be the mason server
        -- run :Mason to see its config servers
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },

    {
        -- ESUNRE INSTALLED THIS LSP server languages
        -- this makes sure individual language servers are installed 
        -- if we want to add ls for a new language we can add it here 
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls", --server for lua language
                    "bashls",
                    "ast_grep",
                    "clangd",
                    "harper_ls",
                    "cmake",
                    "dockerls",
                    "jsonls",
                    "pylsp",
                    "sqlls",
                }
            })
        end
     },
    {
        -- Hooking nvim with lsp servers
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            
        end
    },
}


