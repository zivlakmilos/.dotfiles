-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>nr", function()
  local curDir = vim.fn.getcwd()
  local pfile = io.popen('ls "' .. curDir .. '"/lua')
  if pfile == nil then
    return
  end

  for filename in pfile:lines() do
    package.loaded[filename] = nil
    require(filename)
  end
end, { desc = "Reload Curret Dev Plugin" })

vim.keymap.set("n", "<leader>nt", "<leader>at", { desc = "Run Plenery Tests", remap = true })

vim.keymap.set("n", "<A-n>", "<cmd>silent !tmux neww tmux-sessionizer.sh<cr>")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank in system clipboard", remap = true })
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste in system clipboard", remap = true })
