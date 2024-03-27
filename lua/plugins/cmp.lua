return {
  "hrsh7th/cmp-nvim-lsp-signature-help",
  dependencies = {
    --   "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-calc",
  },
  event = "InsertEnter",
  config = function()
    local cmp = require "cmp"
    local config = cmp.get_config()
    vim.list_extend(config.sources, {
      { name = "nvim_lsp_signature_help" },
      { name = "calc" },
      -- { name = "nvim_lsp_document_symbol" },
    })
    cmp.setup(config)
  end,
}
