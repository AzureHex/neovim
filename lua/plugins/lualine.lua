return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "Isrothy/lualine-diagnostic-message",
    },

    config = function()
        require('lualine').setup({
            options = {
                theme = 'auto', -- dracula
                icons_enabled = true,
                component_separators = '|',
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_b = {
                    {
                        'branch',
                        icon = '',
                    },
                },
                lualine_c = {
                    {
                        'diagnostics',
                        sources = { 'nvim_lsp' },
                        symbols = {
                            error = '',
                            warn = '',
                            info = '',
                            hint = '',
                        },
                        colored = true,
                    },
                },
            },
        })
    end
}
