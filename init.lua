require("config.lazy")
require("lualine").setup()

vim.cmd.colorscheme('neosolarized')
-- nvim-tree
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
})

-- editor options
vim.opt.list = true
vim.opt.listchars = {
  tab = "▸ ",
  trail = "•",
  extends = "❯",
  precedes = "❮",
  nbsp = "␣",
}
-- onSave Actions
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.ts,*tsx",
    callback = function()
        vim.fn.CocAction('runCommand', 'editor.action.organizeImport')
        vim.fn.CocAction('runCommand', 'editor.action.format')
    end,
})

-- cheatsheet
require("cheatsheet").setup({
bundled_cheatsheets = {
         disabled = {'nerd-fonts'},
     },
})

