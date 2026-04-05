require 'nvim-treesitter'.setup {

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require('nvim-treesitter').install { 'c', 'rust', 'python', 'lua', 'vim', 'vimdoc', 'markdown', 'markdown_inline' }
