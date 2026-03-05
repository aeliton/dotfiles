require 'nvim-treesitter.configs'.setup {
  ensure_installed = { 'c', 'rust', 'python', 'lua', 'vim', 'vimdoc', 'markdown', 'markdown_inline' },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
