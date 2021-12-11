if !exists('g:loaded_nvim_treesitter')
  echom "Treesitter not loaded"
  finish
endif

lua <<EOF
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      disable = { "ruby" },
    },
    indent = {
      enable = false,
      disable = {},
    },
    ensure_installed = {
      "clojure",
      "lua",
      "elixir",
      "tsx",
      "toml",
      "json",
      "yaml",
      "html",
      "scss",
      "haskell"
    },
  }
EOF
