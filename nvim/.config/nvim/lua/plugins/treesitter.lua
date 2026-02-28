return 
{
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
        require'nvim-treesitter'.setup {
          -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
          install_dir = vim.fn.stdpath('data') .. '/site'
        }
        
        require'nvim-treesitter'.install { 'rust', 'javascript', 'zig', 'c', 'cpp', 'python', 'go', 'javascript' }
        
        vim.api.nvim_create_autocmd('FileType', {
          pattern = { '*.c', '*.py', '*.rs', '*.go', '*.cpp', '*.lua' },
          callback = function() vim.treesitter.start() end,
        })
        
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
}
