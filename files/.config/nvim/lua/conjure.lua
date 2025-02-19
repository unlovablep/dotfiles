-- clojure (requires vim-jack-in and its deps for opening the REPL)
vim.api.nvim_create_autocmd(
    { "FileType" },
    {
        pattern = "clojure",
        callback = function()
            vim.cmd("tabnew"); -- when opening :Clj in an autocmd it splits instead of tabbing.
            vim.cmd("Clj"); -- open our clojure repl
            vim.cmd("tabfirst"); -- return to the file
            vim.api.nvim_set_keymap('n', 'k', ':ConjureEval<CR>', { noremap = true });
            vim.api.nvim_set_keymap('v', 'k', ':ConjureEval<CR>', { noremap = true }); -- visual mode
            vim.api.nvim_set_keymap('x', 'k', ':ConjureEval<CR>', { noremap = true }); -- visual block/line mode
            vim.cmd("tabonly"); -- close the tabs opened by :Clj
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "x", true); -- escape insert mode
        end,
})
-- fennel (requires aniseed, works seamlessly)
vim.api.nvim_create_autocmd(
    { "FileType" },
    {
        pattern = "fennel",
        callback = function()
            vim.api.nvim_set_keymap('n', 'k', ':ConjureEval<CR>', { noremap = true });
            vim.api.nvim_set_keymap('v', 'k', ':ConjureEval<CR>', { noremap = true }); -- visual mode
            vim.api.nvim_set_keymap('x', 'k', ':ConjureEval<CR>', { noremap = true }); -- visual block/line mode
        end
})
-- racket (requires vim-racket for filetype)
-- make sure you have XREPL (extended repl, a racket library) by running ,? in a racket repl (you should have it)
vim.api.nvim_create_autocmd(
    { "FileType" },
    {
        pattern = "racket",
        callback = function()
            vim.api.nvim_set_keymap('n', 'k', ':ConjureEval<CR>', { noremap = true });
            vim.api.nvim_set_keymap('v', 'k', ':ConjureEval<CR>', { noremap = true }); -- visual mode
            vim.api.nvim_set_keymap('x', 'k', ':ConjureEval<CR>', { noremap = true }); -- visual block/line mode
        end
})
-- TODO commonlisp - requires running a swank server in your root dir manually

-- lua (requires nvim-treesitter - make sure to run :TSInstall lua)
vim.api.nvim_create_autocmd(
    { "FileType" },
    {
        pattern = "lua",
        callback = function()
            vim.g['conjure#extract#tree_sitter#enabled'] = true;
            vim.api.nvim_set_keymap('n', 'k', ':ConjureEval<CR>', { noremap = true });
            vim.api.nvim_set_keymap('v', 'k', ':ConjureEval<CR>', { noremap = true }); -- visual mode
            vim.api.nvim_set_keymap('x', 'k', ':ConjureEval<CR>', { noremap = true }); -- visual block/line mode
        end
})
-- python (requires nvim-treesitter - make sure to run :TSInstall python)
vim.api.nvim_create_autocmd(
    { "FileType" },
    {
        pattern = "python",
        callback = function()
            vim.api.nvim_set_keymap('n', 'k', ':ConjureEval<CR>', { noremap = true });
            vim.api.nvim_set_keymap('v', 'k', ':ConjureEval<CR>', { noremap = true }); -- visual mode
            vim.api.nvim_set_keymap('x', 'k', ':ConjureEval<CR>', { noremap = true }); -- visual block/line mode
        end
})
-- rust
vim.api.nvim_create_autocmd(
    { "FileType" },
    {
        pattern = "rust",
        callback = function()
            vim.api.nvim_set_keymap('n', 'k', ':ConjureEval<CR>', { noremap = true });
            vim.api.nvim_set_keymap('v', 'k', ':ConjureEval<CR>', { noremap = true }); -- visual mode
            vim.api.nvim_set_keymap('x', 'k', ':ConjureEval<CR>', { noremap = true }); -- visual block/line mode
            vim.g['conjure#extract#tree_sitter#enabled'] = true
        end
})
local function async_till_close(cmd) -- run a shell command, but ensure it exits when nvim exits
    local h = vim.fn.jobstart(cmd, {detach=true});
    vim.api.nvim_create_autocmd('VimLeave', {
            callback = function()
                if h then vim.fn.jobstop(h) end
            end,
    });
end
-- janet
vim.api.nvim_create_autocmd(
    { "FileType" },
    {
        pattern = "janet",
        callback = function()
            async_till_close('janet -e "(import spork/netrepl) (netrepl/server)"')
            vim.api.nvim_set_keymap('n', 'k', ':ConjureEval<CR>', { noremap = true });
            vim.api.nvim_set_keymap('v', 'k', ':ConjureEval<CR>', { noremap = true }); -- visual mode
            vim.api.nvim_set_keymap('x', 'k', ':ConjureEval<CR>', { noremap = true }); -- visual block/line mode
            vim.g['conjure#extract#tree_sitter#enabled'] = true
        end
})
-- hy
vim.api.nvim_create_autocmd(
    { "FileType" },
    {
        pattern = "hy",
        callback = function()
            vim.api.nvim_set_keymap('n', 'k', ':ConjureEval<CR>', { noremap = true });
            vim.api.nvim_set_keymap('v', 'k', ':ConjureEval<CR>', { noremap = true }); -- visual mode
            vim.api.nvim_set_keymap('x', 'k', ':ConjureEval<CR>', { noremap = true }); -- visual block/line mode
            vim.g['conjure#extract#tree_sitter#enabled'] = true
        end
})
-- commonlisp
vim.api.nvim_create_autocmd(
    { "FileType" },
    {
        pattern = "lisp",
        callback = function()
            async_till_close("ros run --eval '(ql:quickload :swank)'  --eval '(swank:create-server :dont-close t)'")
            vim.api.nvim_set_keymap('n', 'k', ':ConjureEval<CR>', { noremap = true });
            vim.api.nvim_set_keymap('v', 'k', ':ConjureEval<CR>', { noremap = true }); -- visual mode
            vim.api.nvim_set_keymap('x', 'k', ':ConjureEval<CR>', { noremap = true }); -- visual block/line mode
            vim.g['conjure#extract#tree_sitter#enabled'] = true
            --vim.defer_fn(function()
            --    vim.cmd('set ft=lisp lisp')
            --end, 5000)
        end
})
