return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    config = function()
      require 'nvim-treesitter.configs'.setup {

        ensure_installed = { "lua", "vim", "vimdoc", "markdown", "markdown_inline", "typescript", "javascript", 'cpp' },


        sync_install = false,

        highlight = {
          enable = true,

          -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
          -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
          -- the name of the parser)
          -- list of language that will be disabled
          -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
      }
    end
  },
}
-- vim: ts=2 sts=2 sw=2 et
