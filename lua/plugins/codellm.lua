return {
    -- tgpt.nvim
    {
        'RayenMnif/tgpt.nvim',
        config = function()
            local createBuffer = function()
                local WIDTH = vim.api.nvim_get_option("columns")
                local HEIGHT = vim.api.nvim_get_option("lines")
                vim.api.nvim_open_win(vim.api.nvim_create_buf(false, true), true, {
                    relative = 'editor',
                    width = math.floor(WIDTH / 2),
                    height = math.floor(HEIGHT / 1.1),
                    col = WIDTH,
                    row = 0,
                    anchor = "NE",
                    style = 'minimal',
                    border = 'single'
                })
            end

            local InteractiveChat = function()
                createBuffer()
                vim.api.nvim_command("startinsert")
                vim.fn.termopen("tgpt -i", { on_exit = function()
                    local win_id = vim.api.nvim_get_current_win()
                    vim.api.nvim_win_close(win_id, true)
                end})
            end

            local RateMyCode = function()
                local file = vim.api.nvim_buf_get_name(0)
                local prompt = "cat " .. file .. " | tgpt 'Rate the code'"
                createBuffer()
                vim.fn.termopen(prompt)
            end

            local CheckForBugs = function()
                local file = vim.api.nvim_buf_get_name(0)
                local prompt = "cat " .. file .. " | tgpt 'Check for bugs'"
                createBuffer()
                vim.fn.termopen(prompt)
            end

            -- Create user commands for interaction with tgpt
            vim.api.nvim_create_user_command("Chat", InteractiveChat, {nargs = 0})
            vim.api.nvim_create_user_command("RateMyCode", RateMyCode, {nargs = 0})
            vim.api.nvim_create_user_command("CheckForBugs", CheckForBugs, {nargs = 0})
        end
    },

    -- copilot.vim
    {
        "github/copilot.vim"
    },

    -- gen.nvim
    {
        "David-Kunz/gen.nvim",
        opts = {
            model = "qwen2.5-coder",
            quit_map = "q",
            retry_map = "<c-r>", -- set keymap to re-send the current prompt
            accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
            host = "localhost",
            port = "11434",
            display_mode = "float", -- The display mode. Can be "float", "split", or "horizontal-split".
            show_prompt = false, -- Shows the prompt submitted to Ollama.
            show_model = false, -- Displays which model you are using at the beginning of your chat session.
            no_auto_close = false, -- Never closes the window automatically.
            file = false, -- Write the payload to a temporary file to keep the command short.
            hidden = false, -- Hide the generation window (if true, will implicitly set prompt.replace = true), requires Neovim >= 0.10
            init = function(options)
                pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
            end,
            -- Function to initialize Ollama
            command = function(options)
                local body = {model = options.model, stream = true}
                return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
            end,
            -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
            -- This can also be a command string.
            -- The executed command must return a JSON object with { response, context }
            -- (context property is optional).
            debug = false -- Prints errors and the command which is run.
        }
    },

    -- Key mappings
    vim.keymap.set({ 'n', 'v' }, '<leader>]', ':Gen<CR>'),
    vim.keymap.set('v', '<leader>]', ':Gen Enhance_Grammar_Spelling<CR>')
}

