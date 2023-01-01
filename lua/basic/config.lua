-- color theme
-- tokyonight
vim.cmd [[colorscheme tokyonight]]
vim.g.tokyonight_sidebars = {"nvim-tree", "packer"}
vim.g.tokyonight_style = 'night'
vim.o.background = 'light'

-- tab键为4个空格
vim.cmd [[ set ts=4 ]]
vim.cmd [[ set softtabstop=4 ]]
vim.cmd [[ set shiftwidth=4 ]]
vim.cmd [[ set expandtab ]]
