return {
  "kevinhwang91/nvim-ufo",
  event = { "BufReadPost", "BufNewFile" },
  keys = {
    {
      "zR",
      function()
        require("ufo").openAllFolds()
      end,
    },
    {

      "zM",
      function()
        require("ufo").closeAllFolds()
      end,
    },
    {
      "zr",
      function()
        require("ufo").openFoldsExceptKinds()
      end,
    },
    {
      "zm",

      function()
        require("ufo").closeFoldsWith()
      end,
    },
    {
      "K",
      function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end,
    },
  },
  dependencies = {
    {
      "luukvbaal/statuscol.nvim",
      dependencies = "kevinhwang91/promise-async",
      config = function()
        local builtin = require "statuscol.builtin"
        require("statuscol").setup {
          ft_ignore = { "mason", "Outline", "NvimTree", "lazy" },
          segments = {
            {
              sign = { namespace = { "gitsign" }, maxwidth = 1, auto = true },
              click = "v:lua.ScSa",
            },
            {
              sign = { name = { "Diagnostic" }, maxwidth = 1, auto = true },
              click = "v:lua.ScSa",
            },
            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            { text = { builtin.foldfunc, "" }, click = "v:lua.ScFa" },
          },
        }
      end,
    },
  },
  config = function()
    require("ufo").setup {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    }

    local c = vim.api.nvim_get_hl_by_name("Comment", true)
    vim.api.nvim_set_hl(0, "Folded", { fg = "None", bg = "None", italic = false })
    vim.api.nvim_set_hl(0, "UfoFoldedBg", { fg = "None", bg = "None", italic = false })
    vim.api.nvim_set_hl(0, "FoldColumn", { fg = c.foreground, italic = false })
    vim.api.nvim_set_hl(0, "UfoFoldedEllipsis", { fg = c.foreground, italic = false })
    -- vim.api.nvim_set_hl(0, "UfoFoldedFg", { fg = "None", bg = "None", italic = false })
    -- vim.api.nvim_set_hl(0, "UfoPreviewSbar", { fg = "None", bg = "None", italic = false })
    -- vim.api.nvim_set_hl(0, "UfoPreviewThumb", { fg = "None", bg = "None", italic = false })
    -- vim.api.nvim_set_hl(0, "UfoPreviewWinBar", { fg = "None", bg = "None", italic = false })
    -- vim.api.nvim_set_hl(0, "UfoPreviewCursorLine", { fg = "None", bg = "None", italic = false })
    -- vim.api.nvim_set_hl(0, "UfoFoldedEllipsis", { fg = "None", bg = "None", italic = false })
    -- vim.api.nvim_set_hl(0, "UfoCursorFoldedLine", { fg = "None", bg = "None", italic = false })
  end,
}
