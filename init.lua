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
        vim.cmd [[Prettier]]
        vim.lsp.buf.format()
        vim.lsp.buf.code_action { context = { only = { 'source.organizeImports' } }, apply = true }
        vim.lsp.buf.code_action { context = { only = { 'source.fixAll' } }, apply = true }
        --        vim.fn.CocAction('runCommand', 'editor.action.organizeImport')
        --        vim.fn.CocAction('runCommand', 'editor.action.format')
    end,
})
vim.api.nvim_create_user_command("OR", function()
    --  vim.fn.CocAction('runCommand', 'editor.action.organizeImport')
end, {})



-- cheatsheet
require("cheatsheet").setup({
    bundled_cheatsheets = {
        disabled = { 'nerd-fonts' },
    },
})
