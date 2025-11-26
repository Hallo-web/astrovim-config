return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",
    channel = "stable", -- "stable" or "nightly"
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
        table.insert(config.sources, null_ls.builtins.formatting.clang_format)
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
  },
}
