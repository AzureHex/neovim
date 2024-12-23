return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        vim.keymap.set("n", "-", ":Telescope file_browser path=%:p:h select_buffer=true<CR>"),
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                pickers = {
                    find_files = {
                        hidden = true,
                        theme = "ivy",
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").setup()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader><leader>", builtin.buffers, {})
            require("telescope").load_extension("ui-select")
        end,
    },

    -- Neaterm {Terminal}
    {
        "Dan7h3x/neaterm.nvim",
        branch = "stable",
        event = "VeryLazy",
        opts = {
            float_width = 0.7,
            float_height = 0.7,
            keymaps = {
                toggle = '<A-t>',
                new_vertical = '<A-\\>',
                new_horizontal = '<A-->',
                close = '<A-d>',
                move_up = '<C-A-Up>',
                move_down = '<C-A-Down>',
                move_left = '<C-A-Left>',
                move_right = '<C-A-Right>',
            },
        -- Conditional shell setup
        shell = (function()
            if vim.fn.has("win32") == 1 then
                return "pwsh"  -- Use PowerShell 7 on Windows
            elseif vim.fn.has("unix") == 1 or vim.fn.has("mac") == 1 then
                return "/bin/fish"  -- Default shell for macOS/Linux (change to your preferred shell)
            else
                return vim.o.shell  -- Fallback to the default shell
            end
        end)(),
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "ibhagwan/fzf-lua",
        },
    },
}

