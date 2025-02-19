local rainbow_delimiters = require 'rainbow-delimiters'

require('rainbow-delimiters.setup').setup {
    ensure_installed = {"all"},
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    --priority = {
    --    [''] = 110,
    --    lua = 210,
    --},
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
}
-- HACK: temporary fix to ensure rainbow delimiters are highlighted in real-time
vim.api.nvim_create_autocmd(
   "BufRead",
   {
      desc = "Ensure treesitter is initialized???",
      callback = function()
        pcall(vim.treesitter.start)
      end,
   }
)

-- haxe

vim.api.nvim_create_autocmd(
    {"BufNewFile", "BufRead"},
    {
        pattern = "*.hx",
        callback = function()
            vim.cmd("RainbowParenthesesToggleAll")
        end,
})

vim.api.nvim_create_autocmd(
    {"BufNewFile", "BufRead"},
    {
        pattern = "*.wren",
        callback = function()
            vim.cmd("RainbowParenthesesToggleAll")
        end,
})

vim.g.rbpt_colorpairs = {
    {'brown', 'cyan'},
    {'Darkblue', 'darkmagenta'},
    {'darkgray', 'magenta'},
    {'darkgreen', 'darkcyan'},
    {'darkcyan', 'cyan'},
    {'darkred', 'darkmagenta'},
    {'darkmagenta', 'magenta'},
    {'brown', 'darkcyan'},
    {'gray', 'cyan'},
    {'black', 'darkmagenta'},
    {'darkmagenta', 'magenta'},
    {'Darkblue', 'darkcyan'},
    {'darkgreen', 'cyan'},
    {'darkcyan', 'darkmagenta'},
    {'darkred', 'magenta'},
    {'red', 'darkcyan'}
}

