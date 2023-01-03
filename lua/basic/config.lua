-- color theme
-- tokyonight
vim.g.tokyonight_sidebars = {"nvim-tree", "packer"}
vim.g.tokyonight_style = 'night'
vim.o.background = 'dark'
vim.cmd [[colorscheme tokyonight]]

-- tab键为4个空格
vim.opt.ts = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
