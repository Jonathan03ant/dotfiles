return {
    {
        -- this will be the mason server
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },

    {
        -- this makes sure individual language servers are installed 
        -- if we want to add ls for a new language we can add it here 
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls", --server for lua language
                    "bashls",
                    "pkgbuild_language_server",
                    "ast_grep",
                    "clangd",
                    "harper_ls",
                    "cmake",
                    "neomake",
                    "jinja_lsp",
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

    },
}


