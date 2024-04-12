return {
  "terrortylor/nvim-comment",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      config = function()
        require("ts_context_commentstring").setup {
          enable_autocmd = false,
        }
      end,
    },
  },
  config = function(_, opts)
    opts.hook = function()
      require("ts_context_commentstring").update_commentstring()
    end

    require("nvim_comment").setup(opts)
  end,
}
