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
                        color = { fg = '#98c379' },
                    },
                    {
                        'diff',
                        colored = true,
                        symbols = {
                            added = ' ',
                            modified = ' ',
                            removed = ' ',
                        },
                    },
                    {
                        'diagnostics',
                        sources = { 'nvim_lsp' },
                        symbols = {
                            error = ' ',
                            warn = ' ',
                            info = ' ',
                            hint = '',
                        },
                        colored = true,
                    },
                },
            },
        })
    end
}
