return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
    keys = {
      { "<leader>zc", ":CopilotChat<CR>", mode = "n", desc = "Chat with Copilot" },
      { "<leader>zc", ":CopilotChat<CR>", mode = "v", desc = "Chat with Copilot" },
      { "<leader>ze", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain selected code" },
      { "<leader>zr", ":CopilotChatPreview<CR>", mode = "v", desc = "Review selected code" },
      { "<leader>zf", ":CopilotChatFix<CR>", mode = "v", desc = "Fix selected code" },
      { "<leader>zo", ":CopilotChatOptimize<CR>", mode = "v", desc = "Optimize selected code" },
      { "<leader>zd", ":CopilotChatDocs<CR>", mode = "v", desc = "Generate docs for selection" },
      { "<leader>zt", ":CopilotChatTests<CR>", mode = "v", desc = "Generate tests for selection" },
      { "<leader>zm", ":CopilotChatCommit<CR>", mode = "n", desc = "Generate commit message" },
      { "<leader>zs", ":CopilotChatCommit<CR>", mode = "v", desc = "Generate commit message from selection" },
    },
  },
}
