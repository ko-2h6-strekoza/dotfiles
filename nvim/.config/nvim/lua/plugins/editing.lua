return {

  {
    "numToStr/Comment.nvim",
    opts = {},
    keys = {
      { "<C-_>", "gcc", mode = "n", remap = true, desc = "Comment toggle current line" },
      { "<C-_>", "gc",  mode = "v", remap = true, desc = "Comment toggle selection" },
    }
  },

  {
    "windwp/nvim-autopairs",
    opts = {},
  },

  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
    opts = {},
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        char = {
          enabled = false,
        },
      },
    },
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = { "o" },           function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },

}
