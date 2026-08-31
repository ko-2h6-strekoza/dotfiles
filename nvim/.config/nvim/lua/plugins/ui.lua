return {

  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme gruvbox-material")
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    keys = {
      { "<C-n>", "<cmd>NvimTreeToggle<CR>" },
    },

    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,

    opts = {
      sort_by = "case_sensitive",
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      view = {
        width = 35,
        relativenumber = true,
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      filters = {
        dotfiles = true,
      },
      actions = {
        open_file = {
          quit_on_open = false,
        },
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        component_separators = { left = '╱', right = '╲' },
        section_separators = { left = '', right = '' },
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "slant",
        offset = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },
      },
    },
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enable = false, font = "+2" }
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<CR>", desc = "Zen Mode" } },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      stages = "fade",
      timeout = 3000,
      background_colour = "#000000"
    },
    config = function(_, opts)
      require("notify").setup(opts)
      vim.notify = require("notify")
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.styled_parts"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
  },

}
