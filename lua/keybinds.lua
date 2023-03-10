-- leader 键设置为空格
vim.g.mapleader = " "

-- 重新引用默认的键位
vim.keybinds = {
    gmap = vim.api.nvim_set_keymap,
    bmap = vim.api.nvim_buf_set_keymap,
    dgmap = vim.api.nvim_del_keymap,
    dbmap = vim.api.nvim_buf_del_keymap,
    opts = {
        noremap = true,
        silent = true
    }
}

-- nvim-tree
-- 按 ctrl b 打开文件树
vim.keybinds.gmap("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", vim.keybinds.opts)
-- 按 leader fc 在文件树中找到当前已打开文件的位置
vim.keybinds.gmap("n", "<leader>fc", "<cmd>NvimTreeFindFile<CR>", vim.keybinds.opts)
-- 默认按键
-- o     ：打开目录或文件
-- a     ：新增目录或文件
-- r     ：重命名目录或文件
-- x     ：剪切目录或文件
-- c     ：复制目录或文件
-- d     ：删除目录或文件
-- y     ：复制目录或文件名称
-- Y     ：复制目录或文件相对路径
-- gy    ：复制目录或文件绝对路径
-- p     ：粘贴目录或文件
-- s     ：使用系统默认程序打开目录或文件
-- <Tab> ：将文件添加到缓冲区，但不移动光标
-- <C-v> ：垂直分屏打开文件
-- <C-x> ：水平分屏打开文件
-- <C-]> ：进入光标下的目录
-- <C-r> ：重命名目录或文件，删除已有目录名称
-- -     ：返回上层目录
-- I     ：切换隐藏文件/目录的可见性
-- H     ：切换点文件的可见性
-- R     ：刷新资源管理器
-- 另外，文件资源管理器操作和操作文档方式一致，可按 / ? 进行搜索

-- bufferline 左右Tab切换
vim.keybinds.gmap("n", "<C-h>", ":BufferLineCyclePrev<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-l>", ":BufferLineCycleNext<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-w>", ":BufferLinePickClose<CR>", vim.keybinds.opts)

-- split screen
vim.keybinds.gmap("n", "sv", ":vsp<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "sh", ":sp<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "sc", "<C-w>c", vim.keybinds.opts)
vim.keybinds.gmap("n", "so", "<C-w>o", vim.keybinds.opts) -- close other
-- screen switch
vim.keybinds.gmap("n", "<A-h>", "<C-w>h", vim.keybinds.opts)
vim.keybinds.gmap("n", "<A-j>", "<C-w>j", vim.keybinds.opts)
vim.keybinds.gmap("n", "<A-k>", "<C-w>k", vim.keybinds.opts)
vim.keybinds.gmap("n", "<A-l>", "<C-w>l", vim.keybinds.opts)

-- telescope
vim.keybinds.gmap("n", "<C-p>", "<cmd>Telescope<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-e>", "<cmd>Telescope find_files<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", vim.keybinds.opts)

-- toggleterm
vim.keybinds.gmap("n", "<C-j>", "<cmd>ToggleTerm<CR>", vim.keybinds.opts)


-- lsp keybinds
local pluginKeys = {}
-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
    return {
        -- 上一个
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        -- 下一个
        ['<C-j>'] = cmp.mapping.select_next_item(),
        -- 出现补全
        ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        -- 取消
        ['<A-,>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- 确认
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'})
    }
end
-- lsp 回调函数快捷键设置
pluginKeys.maplsp = function(mapbuf)
    -- rename
    mapbuf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', vim.keybinds.opts)
    -- code action
    mapbuf('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', vim.keybinds.opts)
    -- go xx
    mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', vim.keybinds.opts)
    mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', vim.keybinds.opts)
    mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', vim.keybinds.opts)
    mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', vim.keybinds.opts)
    mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', vim.keybinds.opts)
    -- diagnostic
    mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', vim.keybinds.opts)
    mapbuf('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', vim.keybinds.opts)
    mapbuf('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', vim.keybinds.opts)
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    -- leader + =
    mapbuf('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', vim.keybinds.opts)
    -- mapbuf('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end
return pluginKeys
