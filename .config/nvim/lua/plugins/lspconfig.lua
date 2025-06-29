  return {
  'neovim/nvim-lspconfig',
  tag = 'v2.1.0',
  dependencies = {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
}
