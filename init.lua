require("plugins")
require("options")

vim.cmd.colorscheme('doom-one')
-- nvim-tree

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
})

-- onSave Actions
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.ts,*.tsx,*.lua",
    callback = function()
        -- vim.lsp.buf.format()
        -- vim.lsp.buf.code_action { context = { only = { 'source.organizeImports' } }, apply = true }
        vim.lsp.buf.code_action { context = { only = { 'source.fixAll' } }, apply = true }
        vim.cmd [[Prettier]]
    end,
})

-- cheatsheet
require("cheatsheet").setup({
    bundled_cheatsheets = {
        disabled = { 'nerd-fonts' },
    },
})

-- onOpen Actions

local api = require("nvim-tree.api")

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if (vim.fn.bufname() == "NvimTree_1") then return end

        api.tree.find_file({ buf = vim.fn.bufnr() })
    end,
})
