return {
    {
        "Dan7h3x/neaterm.nvim",
        branch = "stable",
        event = "VeryLazy",
        opts = {
            float_width = 0.9,
            float_height = 0.9,
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
                return "pwsh"
            elseif vim.fn.has("unix") == 1 then
                if vim.fn.has("mac") == 1 then
                    return "/opt/homebrew/bin/zsh"
                else
                    if vim.fn.executable("/sbin/zsh") == 1 then
                        return "/sbin/zsh"
                    else
                        return "/home/linuxbrew/.linuxbrew/bin/zsh"
                    end
                end
            else
                return vim.o.shell
            end
        end)(),
        },
    },
}

