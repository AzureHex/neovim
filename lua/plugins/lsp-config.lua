return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.tailwindcss.setup({
                capabilities = capabilities
            })
            lspconfig.jsonls.setup({
                capabilities = capabilities
            })
            lspconfig.bashls.setup({
                capabilities = capabilities
            })
            lspconfig.yamlls.setup({
                capabilities = capabilities
            })
            lspconfig.solargraph.setup({
                capabilities = capabilities
            })
            lspconfig.html.setup({
                capabilities = capabilities
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })

            vim.diagnostic.config({
                virtual_text = {
                    prefix = '●',
                },
                signs = true,
                update_in_insert = true,
                underline = true,
                severity_sort = true,
            })

            local signs = {
                Error = "",
                Warn = "",
                Info = "",
                Hint = "",
            }

            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.code_action, {})
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
        end,
    },
}
