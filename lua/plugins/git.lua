return {
    {
        "tpope/vim-fugitive"
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()

            vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
            vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
        end
    },
    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("diffview").setup({
                -- You can customize options here if needed
            })

            -- Example keybindings for diffview
            vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", {})
            vim.keymap.set("n", "<leader>gq", ":DiffviewClose<CR>", {})
        end
    }
}
