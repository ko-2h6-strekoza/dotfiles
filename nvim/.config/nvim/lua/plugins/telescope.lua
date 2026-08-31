return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },

    keys = {
      { ";f", "<cmd>Telescope find_files<CR>" },
      { ";g", "<cmd>Telescope live_grep<CR>" },
      { ";b", "<cmd>Telescope buffers<CR>" },
      { ";h", "<cmd>Telescope help_tags<CR>" },
    },

    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
          },
          n = {
            ["q"] = require("telescope.actions").close,
          },
        },
      },
    },
  },
}
