return {
    "stevearc/oil.nvim",
    config = function()
        local oil = require("oil")
        oil.setup({
            float = {
                max_width = 130,
                max_height = 40,
            },
        })
        vim.keymap.set("n", "-", oil.toggle_float, {})
    end,
}
