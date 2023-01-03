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
        show_close_icon = false,
        show_duplicate_prefix = true,
        separator_style = 'thin',
        always_show_bufferline = true,
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        }
    }
}
