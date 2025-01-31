return {
  "mfussenegger/nvim-dap",

  keys = {
    {
      "<F5>",
      function()
        require("dap").continue({ before = get_args })
      end,
      desc = "Run with Args",
    },
    {
      "<F6>",
      function()
        require("dap").step_out()
      end,
      desc = "Step Out",
    },
    {
      "<F7>",
      function()
        require("dap").step_over()
      end,
      desc = "Step Over",
    },
    {
      "<F8>",
      function()
        require("dap").step_into()
      end,
      desc = "Step Into",
    },
    {
      "<F9>",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },
  },
}
