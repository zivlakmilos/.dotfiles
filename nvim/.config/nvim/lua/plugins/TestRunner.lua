return {
  "zivlakmilos/TestRunner.nvim",
  keys = {
    {
      "<leader>at",
      function()
        require("TestRunner").run_test()
      end,
      desc = "Test Runner",
    },
  },
}
