require('nvim-treesitter.configs').setup({
    ensure_installed = { "c", "lua", "cpp", "python", "bash", "cmake", "dockerfile", "html", "java", "javascript", "json", "json5", "jsonc", "sql", "typescript", "vim", "vue"},

    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
  },
   -- 启用增量选择
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    }
  }
})
