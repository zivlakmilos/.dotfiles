return {
  "mickael-menu/zk-nvim",
  config = function()
    require("zk").setup({
      -- See Setup section below
    })
  end,
  keys = {
    {
      "<leader>zn",
      "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>",
      desc = "ZkNew",
    },
    {
      "<leader>zo",
      "<Cmd>ZkNotes { sort = { 'modified' } }<CR>",
      desc = "ZkNotes",
    },
    {
      "<leader>zo",
      "<Cmd>ZkNotes { sort = { 'modified' } }<CR>",
      desc = "ZkNotes",
    },
    {
      "<leader>zt",
      "<Cmd>ZkTags<CR>",
      desc = "ZkNotes",
    },
  },
}
