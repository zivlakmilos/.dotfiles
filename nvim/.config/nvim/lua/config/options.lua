-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- Disable default: Use system clipboard
opt.clipboard = ""

opt.colorcolumn = "80"

vim.filetype.add({
  extension = {
    templ = "templ",
  },
})

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { { ".git", "lua" }, "lsp", "cwd" }

-- Disable animations
vim.g.snacks_animate = false
