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

-- cheatsheet
require("cheatsheet").setup({
bundled_cheatsheets = {
         disabled = {'nerd-fonts'},
     },
})

