local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require("lazy").setup({
    "xiyaowong/transparent.nvim",
    --"vim-airline/vim-airline",
    "preservim/nerdtree",
    -- THEMES
    "sainnhe/everforest", -- low-key grey
    "folke/tokyonight.nvim", -- purple
    "catppuccin/nvim", -- customizable theme

    "nvim-lualine/lualine.nvim",

    --"vim-airline/vim-airline-themes",


    "preservim/tagbar",
    "norcalli/nvim-colorizer.lua",
    "NLKNguyen/vim-lisp-syntax",
    "ollykel/v-vim",
    "leafgarland/typescript-vim",
    "yuezk/vim-js",
    "MaxMEllon/vim-jsx-pretty",
    "sheerun/vim-polyglot",
    "ap/vim-css-color",

    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",

    "nvim-treesitter/nvim-treesitter",
    --"HiPhish/nvim-ts-rainbow2",
    "HiPhish/rainbow-delimiters.nvim",

    "wlangstroth/vim-racket",

    "kien/rainbow_parentheses.vim",

    "lluchs/vim-wren",

    "jaawerth/fennel.vim",

    "Olical/conjure",
    "tpope/vim-dispatch",
    "clojure-vim/vim-jack-in",
    "radenling/vim-dispatch-neovim",
    "Olical/aniseed",

    "janet-lang/janet.vim",

    "vim-ruby/vim-ruby",

    "hylang/vim-hy",

    --"monkoose/parsley",
    --"monkoose/nvlime",
    "vlime/vlime",
    --"HiPhish/nvim-cmp-vlime",
    "krischik/vim-ada",
    "udalov/kotlin-vim",
    --"alaviss/nim.nvim",
    {
        "scalameta/nvim-metals",
        dependencies = {
          "nvim-lua/plenary.nvim",
        },
        ft = { "scala", "sbt", "java" },
        opts = function()
          local metals_config = require("metals").bare_config()
          metals_config.on_attach = function(client, bufnr)
            -- your on_attach function
          end
          return metals_config
        end,
        config = function(self, metals_config)
          local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
          vim.api.nvim_create_autocmd("FileType", {
            pattern = self.ft,
            callback = function()
              require("metals").initialize_or_attach(metals_config)
            end,
            group = nvim_metals_group,
          })
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    }
})
