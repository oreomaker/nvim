require'toggleterm'.setup {
    shade_terminals = true,
    start_in_insert = true,
    direction = 'horizontal',
    shell = vim.fn.has "win32" == 1 and "pwsh" or "zsh",
}
