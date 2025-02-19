function FRtest(inp) return print(inp.fargs[1]) end
vim.api.nvim_create_user_command('FRtest',FRtest, { nargs = 1})
