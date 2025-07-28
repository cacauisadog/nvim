return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_ls = {
          filetypes = {
            "css",
            "eruby",
            "html",
            "javascript",
            "javascriptreact",
            -- "typescriptreact",
            "less",
            "sass",
            "scss",
            "svelte",
            "pug",
            "vue",
          },
        },
      },
    },
  },
}
