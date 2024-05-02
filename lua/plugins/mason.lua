return {
  "mason.nvim",
  opts = {
    automatic_installation = true,
    ensure_installed = {
      -- py
      "black",
      "debugpy",
      "pylint",
      "pyright",

      -- lua
      "stylua",
      "lua-language-server",
      "luacheck",

      -- C/C++
      "clang-format",
      -- "cpptools",
      "codelldb",
      "clangd",
      "cpplint",

      -- rust
      "rust-analyzer",

      -- json
      "json-lsp",
      "jsonlint",
      "prettier",

      -- make
      "cmakelang",

      -- docker
      "dockerfile-language-server",
      "docker-compose-language-service",

      -- yaml
      "yaml-language-server",

      -- markdown
      "markdownlint",
      "marksman",

      -- github
      "actionlint",

      -- PHP
      "intelephense",
      "pretty-php",
      "phpstan",
      "phpcs",
      "php-debug-adapter",
    },
    ui = {
      icons = {
        package_pending = " ",
        package_installed = " ",
        package_uninstalled = " ",
      },
    },
  },
  -- https://www.lazyvim.org/plugins/lsp#mason-lspconfignvim
  config = function(_, opts)
    require("mason").setup(opts)
    local mr = require "mason-registry"
    local function ensure_installed()
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end
    if mr.refresh then
      mr.refresh(ensure_installed)
    else
      ensure_installed()
    end
  end,
}
