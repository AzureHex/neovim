return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
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
                        'branch',  -- Keep the branch component
                        icon = '',  -- Custom Git icon (change this to any icon you prefer)
                    },
                },
            },
        })
    end
}
