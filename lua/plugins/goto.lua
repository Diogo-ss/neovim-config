return {
  "rmagatti/goto-preview",
  lazy = false,
  keys = {
    { "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>" },
    { "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>" },
    { "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>" },
    { "gpD", "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>" },
    { "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>" },
    { "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>" },
  },
  config = function()
    require("goto-preview").setup {
      border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" },
      focus_on_open = true,
      preview_window_title = { enable = true, position = "right" },
    }
  end,
}
