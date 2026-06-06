-- ============================================================
--  NEOVIM CONFIG - No LSP version
--  Kanan | SOCAR CIC
-- ============================================================

-- ── BOOTSTRAP LAZY.NVIM ─────────────────────────────────────
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ── BASIC SETTINGS ──────────────────────────────────────────
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.expandtab      = true
vim.opt.smartindent    = true
vim.opt.wrap           = false
vim.opt.cursorline     = true
vim.opt.termguicolors  = true
vim.opt.signcolumn     = "yes"
vim.opt.scrolloff      = 8
vim.opt.hlsearch       = true
vim.opt.incsearch      = true
vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.splitright     = true
vim.opt.splitbelow     = true
vim.opt.clipboard      = "unnamedplus"

vim.g.mapleader = " "

-- ── PLUGINS ─────────────────────────────────────────────────
require("lazy").setup({

  -- ── Theme ──────────────────────────────────────────────
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = false,
        terminal_colors = true,
      })
      vim.cmd("colorscheme tokyonight")
    end,
  },

  -- ── Status Line ────────────────────────────────────────
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
          component_separators = "|",
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = { "filename" },
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  -- ── Buffer Tabs ─────────────────────────────────────────
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          show_buffer_close_icons = true,
          show_close_icon = false,
          separator_style = "slant",
        },
      })
    end,
  },

  -- ── File Explorer ───────────────────────────────────────
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        window = { width = 30 },
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
      })
    end,
  },

  -- ── Fuzzy Finder ────────────────────────────────────────
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "horizontal",
          file_ignore_patterns = { "node_modules", "__pycache__", ".git/" },
        },
      })
      require("telescope").load_extension("fzf")
    end,
  },

  -- ── Syntax Highlighting ─────────────────────────────────
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if not ok then return end
      configs.setup({
        ensure_installed = {
          "python", "lua", "bash", "json", "yaml",
          "markdown", "c", "cpp", "cuda",
        },
        highlight = { enable = true },
        indent    = { enable = true },
      })
    end,
  },

  -- ── Git ─────────────────────────────────────────────────
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "▎" },
          change       = { text = "▎" },
          delete       = { text = "▎" },
          topdelete    = { text = "▎" },
          changedelete = { text = "▎" },
        },
        on_attach = function(bufnr)
          local gs   = package.loaded.gitsigns
          local opts = { buffer = bufnr }
          vim.keymap.set("n", "<leader>gp", gs.preview_hunk, opts)
          vim.keymap.set("n", "<leader>gb", gs.blame_line,   opts)
          vim.keymap.set("n", "<leader>gr", gs.reset_hunk,   opts)
          vim.keymap.set("n", "]g",         gs.next_hunk,    opts)
          vim.keymap.set("n", "[g",         gs.prev_hunk,    opts)
        end,
      })
    end,
  },

  -- ── Auto Pairs ──────────────────────────────────────────
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({ check_ts = true })
    end,
  },

  -- ── Comment Toggle ──────────────────────────────────────
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- ── Indent Lines ────────────────────────────────────────
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
        scope  = { enabled = true },
      })
    end,
  },

  -- ── Icons ───────────────────────────────────────────────
  { "nvim-tree/nvim-web-devicons" },

})

-- ── KEYBINDS ────────────────────────────────────────────────

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles,   { desc = "Recent files" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags,  { desc = "Help tags" })

-- Neo-tree
vim.keymap.set("n", "<C-b>",     ":Neotree toggle<CR>", { desc = "Toggle file tree" })
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file tree" })

-- Bufferline
vim.keymap.set("n", "<Tab>",     ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>",   ":BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "<leader>x", ":bd<CR>",                  { desc = "Close buffer" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move up" })

-- General
vim.keymap.set("n", "<leader>h", ":noh<CR>",     { desc = "Clear highlights" })
vim.keymap.set("n", "<leader>w", ":w<CR>",        { desc = "Save" })
vim.keymap.set("n", "<leader>q", ":q<CR>",        { desc = "Quit" })
vim.keymap.set("n", "<leader>t", ":terminal<CR>", { desc = "Open terminal" })

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Unindent" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent" })
