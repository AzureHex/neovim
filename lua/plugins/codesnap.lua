return {
  "mistricky/codesnap.nvim",
  build = "make build_generator",
  keys = {
    { "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
    { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
  },
  opts = {
    mac_window_bar = true,
    code_font_family = "JetBrainsMono Nerd Font",
    show_workspace = false,
    watermark = "",
    min_width = 0,
    bg_x_padding = 102,
    bg_y_padding = 62,
    save_path = "~/Pictures",
    has_breadcrumbs = true,
    bg_theme = "dusk",
  },
}
