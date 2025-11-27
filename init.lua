return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",
    channel = "stable",
    version = "latest",
    branch = "main",
    commit = nil,
    pin_plugins = nil,
    skip_prompts = false,
    show_changelog = true,
  },

  -- Formatting settings
  formatting = {
    format_on_save = {
      enabled = true,
    },
  },

  -- Plugin configuration
  plugins = {
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = function(_, config)
        local null_ls = require("null-ls")
        config.sources = config.sources or {}
        
        -- Formatter: clang-format for C/C++
        table.insert(config.sources, null_ls.builtins.formatting.clang_format)
        
        -- Linter: clang-tidy for C/C++ static analysis
        table.insert(config.sources, null_ls.builtins.diagnostics.clang_check)
        
        return config
      end,
    },
  },

  -- LSP configuration
  lsp = {
    formatting = {
      format_on_save = {
        enabled = true,
      },
    },
    config = {
      clangd = {
        capabilities = {
          offsetEncoding = "utf-8",
        },
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy=false",  -- Disable clangd's built-in clang-tidy
          "--completion-style=detailed",
          "--header-insertion=never",
        },
      },
    },
  },
}
