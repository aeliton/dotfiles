vim.g.nvim_tree_show_icons = {
  folders = 0,
  files = 0,
  git = 0,
  folder_arrows = 0,
}

require('nvim-tree').setup {
  renderer = {
    icons = {
      show = {
        file = false,
        folder = true,
        folder_arrow = true,
        git = true
      },
    },
  },
  filters = {
    dotfiles = true,
    git_ignored = true,
  },
}
