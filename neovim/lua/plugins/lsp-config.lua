return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "nvimdev/lspsaga.nvim",
      "ray-x/lsp_signature.nvim",
      "folke/neodev.nvim",
    },
    config = function()
      -- Mason setup
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "bashls",
          "ast_grep",
          "clangd",
          "harper_ls",
          "cmake",
          "dockerls",
          "jsonls",
          "pylysp",
          "sqlls",
        },
      })

      -- LSP and UI setup
      local lspconfig = require("lspconfig")
      local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_lsp.default_capabilities()

      require("neodev").setup()
      require("lspsaga").setup()

      local servers = {
        "lua_ls", "bashls", "clangd", "cmake", "dockerls",
        "jsonls", "pylysp", "sqlls",
      }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            require("lsp_signature").on_attach({}, bufnr)
            local buf = vim.lsp.buf
            vim.keymap.set("n", "K", buf.hover, { buffer = bufnr })
            vim.keymap.set("n", "gd", buf.definition, { buffer = bufnr })
            vim.keymap.set("n", "gi", buf.implementation, { buffer = bufnr })
            vim.keymap.set("n", "<leader>ca", buf.code_action, { buffer = bufnr })
          end,
        })
      end
    end,
  },
}
