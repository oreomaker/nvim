vim.opt.termguicolors = true
require("bufferline").setup {
    options = {
        -- use nvim built in lsp
        diagnostics = 'nvim_lsp',
        offsets = {{
            filetype = 'NvimTree',
            text = 'File Explorer',
            highlight = 'Directory',
            text_align = 'left',
            separator = true
        }},
        indicator = {
            style = 'icon'
        },
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        }
    }
}
