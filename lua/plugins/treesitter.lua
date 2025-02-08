return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
        ensure_installed = { "bash", "json", "lua", "markdown", "powershell", "yaml" },
				highlight = { enable = false },
				indent = { enable = true },
			})
		end
	},
  {
    'numToStr/Comment.nvim',
    opts = {
    }
  },
  {
    'MeanderingProgrammer/markdown.nvim',
    main = "render-markdown",
    opts = {},
    name = 'render-markdown',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  },
}
