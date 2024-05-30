return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      templ = {},
      htmx = {
        filetypes = { "html", "templ" },
      },
      tailwindcss = {
        filetypes = { "templ" },
      },
    },
    inlay_hints = {
      enabled = false,
    },
  },
}
