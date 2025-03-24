local lspconfig = require('lspconfig')
local cmp = require('cmp')

lspconfig.zls.setup{ -- zig
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }

        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    end,
}
vim.g.zig_fmt_autosave = 0 -- disable auto formatting on save

lspconfig.serve_d.setup{
    cmd = { "serve-d" },
    filetypes = { "d" },
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }

        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    end,
}

lspconfig.erlangls.setup{
    cmd = { "erlang_ls" },
    filetypes = { "erlang" },
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }

        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    end,
}

lspconfig.elixirls.setup{
    cmd = { "elixir-ls" },
    filetypes = { "elixir" },
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }

        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    end,
}

lspconfig.nim_langserver.setup{
    cmd = { 'nimlangserver' },
    filetypes = { 'nim' },
    settings = {
        nim = {
            timeout = 600000,
        },
    },
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }

        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    end,
}

lspconfig.nixd.setup{}

lspconfig.ols.setup{
    cmd = { '/home/lily/OPT/bin/ols' },
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }

        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    end,
}

lspconfig.ocamllsp.setup{
    cmd = { 'ocamllsp' },
    filetypes = { 'ocaml', 'menhir', 'ocamlinterface', 'ocamllex', 'reason', 'dune' },
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local opts = { noremap=true, silent=true }

        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    end,
}

lspconfig.v_analyzer.setup{
    cmd = { '/home/lily/.config/v-analyzer/bin/v-analyzer' },
    filetypes = { 'v', 'vv', 'vsh', 'vlang' },
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }

        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    end,
}

--local has_flsproject = function()
--    local dir = vim.fn.getcwd()
--
--    while dir ~= '/' and dir ~= '' do
--        local projfile = dir .. '/flsproject.fnl'
--        if vim.fn.filereadable(projfile) == 1 then
--            print("Using flsproject: " .. projfile)
--            return true
--        end
--        dir = vim.fn.fnamemodify(dir, ':h')
--    end
--    return false
--end
--
--if has_flsproject() then
lspconfig.fennel_ls.setup{ -- fennel-ls requires flsproject.fnl
        cmd = {'fennel-ls'},
        filetypes = {'fennel'},
        on_attach = function(client, bufnr)
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local opts = { noremap=true, silent=true }
            buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        end,
}

lspconfig.gleam.setup{
        cmd = {'gleam', 'lsp'},
        filetypes = {'gleam'},
        on_attach = function(client, bufnr)
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local opts = { noremap=true, silent=true }
            buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        end,
}

lspconfig.ada_ls.setup{ -- fennel-ls requires flsproject.fnl
        on_attach = function(client, bufnr)
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local opts = { noremap=true, silent=true }
            buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        end,
}
--else
--[[
    lspconfig.fennel_language_server.setup({
            cmd = {'fennel-language-server'},
            filetypes = {'fennel'},
        on_attach = function(client, bufnr)
            print("Falling back from fennel-ls to fennel-language-server")
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local opts = { noremap=true, silent=true }
    
            buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        end,
    })
]]
--end

-- finds rootdir based on project.clj, deps.edn, build.boot, .git, etc...
lspconfig.clojure_lsp.setup{
    cmd = { "clojure-lsp" },
    filetypes = { "clojure", "edn" },
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    end,
}

lspconfig.clangd.setup{
    cmd = {"clangd"},
    filetypes = {"c", "cpp"},
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    end,
}

lspconfig.rust_analyzer.setup{
    cmd = {"rust-analyzer"},
    filetypes = {"rust"},
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    end,
}

--lspconfig.csharp_ls.setup{
--    cmd = {"csharp-ls"},
--    filetypes = {"cs"},
--    on_attach = function(client, bufnr)
--        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--        local opts = { noremap=true, silent=true }
--        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--    end,
--}
lspconfig.omnisharp.setup {
    cmd = { "omnisharp" },
    filetypes = { "cs" },
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    end,
}

lspconfig.fsharp_language_server.setup {
    cmd = { "fsautocomplete", "--adaptive-lsp-server-enabled" },
    filetypes = { "fsharp" },
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    end,
}

lspconfig.kotlin_language_server.setup{
    --cmd = {"/home/lily/OPT/bin/kotlin-language-server"}, -- defaults to /sbin which fails
    cmd = {"/usr/bin/kotlin-language-server"}, -- defaults to /sbin which fails
    --filetypes = {"kotlin"},
    --root_dir = lspconfig.util.root_pattern("build.gradle.kts", "build.gradle", "pom.xml", "settings.gradle", "settings.gradle.kts", ".git"),
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    end,
}

--lspconfig.metals.setup{
--    cmd = {"metals"}, -- defaults to /sbin which fails
--    filetypes = {"scala"},
--    root_dir = lspconfig.util.root_pattern("settings.gradle", "settings.gradle.kts", "build.gradle.kts", "build.gradle", "pom.xml", ".git"),
--    on_attach = function(client, bufnr)
--        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--        local opts = { noremap=true, silent=true }
--        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--    end,
--}

lspconfig.sourcekit.setup{ -- Swift, Objective-C, etc
    cmd = { "sourcekit-lsp" },
    filetypes = { "swift", "objc", "objcpp" }, -- can also be used for c/c++
    root_dir = lspconfig.util.root_pattern("Package.swift", ".git"); -- Package.swift is generated by `swift package init`
    capabilities = {
        workspace = {
            didChangeWatchedFiles = {
                dynamicRegistration = true,
            },
        },
    },
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    end,
}

lspconfig.solargraph.setup{
        cmd = { "solargraph", "stdio" },
        filetypes = { "ruby" },
        root_dir = lspconfig.util.root_pattern('Gemfile', 'Gemfile.lock', '.git', '.ruby-lsp'),
        on_attach = function(client, bufnr)
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local opts = { noremap=true, silent=true }
            buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        end,
}

lspconfig.racket_langserver.setup{
        cmd = { "racket", "--lib", "racket-langserver" },
        filetypes = { "racket", "scheme" },
        on_attach = function(client, bufnr)
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local opts = { noremap=true, silent=true }
            buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        end,
}

lspconfig.haxe_language_server.setup{
        cmd = {"node", "/home/lily/BIN/haxe-language-server.js"}, -- cones from vshaxe's haxe-language-server (build it from github)
        filetypes = { "haxe", "hxml" }, -- it also can parse hxml :)
        on_attach = function(client, bufnr)
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local opts = { noremap=true, silent=true }
            buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        end,
}

lspconfig.pylsp.setup{
        cmd = {"pylsp"},
        filetypes = { "python" },
        on_attach = function(client, bufnr)
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local opts = { noremap=true, silent=true }
            buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        end,
}

lspconfig.ocamlls.setup{
        cmd = {"ocaml-language-server", "--stdio"},
        filetypes = { "ocaml", "reason" },
        on_attach = function(client, bufnr)
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local opts = { noremap=true, silent=true }
            buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        end,
}

lspconfig.janet_lsp.setup{
        cmd = {"janet-lsp", "--stdio"},
        filetypes = { "janet" },
        on_attach = function(client, bufnr)
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local opts = { noremap=true, silent=true }
            buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        end,
}

--lspconfig.ocamllsp.setup{
--        cmd = {"ocamllsp"},
--        filetypes = { "ocaml", "dune", "menhir", "ocamlinterface", "reason", "ocamllex" },
--        on_attach = function(client, bufnr)
--            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--            local opts = { noremap=true, silent=true }
--            buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--            buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--            buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--        end,
--}

lspconfig.lua_ls.setup{
        cmd = {"lua-language-server"},
        filetypes = {"lua"},
        on_attach = function(client, bufnr)
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local opts = { noremap=true, silent=true }
            buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        end,

        -- for nvim
        on_init = function(client)
            if client.workspace_folders then
              local path = client.workspace_folders[1].name
              if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
                return
              end
            end

            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
              runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
              },
              -- Make the server aware of Neovim runtime files
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME
                  -- Depending on the usage, you might want to add additional paths here.
                  -- "${3rd}/luv/library"
                  -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                -- library = vim.api.nvim_get_runtime_file("", true)
              }
            })
    end,
    settings = {
        Lua = {}
    }
}

require('lspconfig.configs').hy = {
    default_config = {
        cmd = { 'hyuga' },
        filetypes = { 'hy' },
        root_dir = function(fname)
            return lspconfig.util.path.dirname(fname)
        end,
    },
    docs = {
        description = "Hyuga language server for the Hy programming language"
    }
}

lspconfig.hy.setup{
        cmd = {"hyuga"},
        filetypes = {"hy"},
        on_attach = function(client, bufnr)
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local opts = { noremap=true, silent=true }
            buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        end,
}

---- recognise .hy files
--vim.api.nvim_create_autocmd("FileType", {
--    once = true,
--    pattern = 'hy',
--    callback = function(_)
--        local ls_entry = lspconfig.configs.hy
--        ls_entry.setup {
--        }
--    end
--})

--require'lspconfig.configs'.cl_lsp = { -- common lisp
--    default_config = {
--        cmd = { "cl-lsp" },
--        filetypes = { "lisp", "common-lisp" },
--        root_dir = lspconfig.util.root_pattern("*.asd", ".git", "."),
--        settings = {},
--    }
--}
--
--lspconfig.cl_lsp.setup{
--    cmd = { "cl-lsp" },
--    filetypes = { "lisp", "common-lisp" },
--    on_attach = function(client, bufnr)
--        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--        local opts = { noremap=true, silent=true }
--        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--    end,
--}

--vim.api.nvim_create_autocmd("CursorHold", {
--    callback = function()
--        if vim.fn.pumvisible() == 0 then
--            vim.lsp.buf.hover()
--        end
--    end,
--    buffer = 0,  -- Use 0 for the current buffer
--})
--vim.opt.updatetime = 1000

cmp.setup{
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For LuaSnip users.
        end,
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    },
}

--cmp.setup.filetype({'lisp'}, {
--        sources = {
--            { name = 'vlime' },
--        }
--})

cmp.setup.cmdline(':', {
    sources = {
        { name = 'cmdline' }
    }
})
