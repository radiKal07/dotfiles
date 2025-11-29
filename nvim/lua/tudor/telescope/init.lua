require("telescope").setup {
  defaults = {
    file_ignore_patterns = { "%.uid", "%.png", "%.import", "%.tscn", "%.wav", "%.tres", "%.svg", "%.ttf" },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    }
  }
}

require("telescope").load_extension("ui-select")
require("telescope").load_extension("dap")
