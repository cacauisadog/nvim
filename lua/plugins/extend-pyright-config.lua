return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        settings = {
          python = {
            analysis = {
              extraPaths = { "./", "./project", "./apps" }, -- adjust to your project
              typeCheckingMode = "basic",
            },
          },
        },
      },
    },
  },
}
