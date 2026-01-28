return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  lazy = false, -- neo-tree will lazily load itself
  config = function()
    require("neo-tree").setup({
      window = {
        position = "right",
      },
    })

    -- Mappings modernos
    vim.keymap.set({ "n", "v" }, "<leader>t", ":Neotree toggle<CR>", {
      desc = "Toggle Neo-tree",
      noremap = true,
      silent = true,
    })

    vim.keymap.set("n", "<leader>e", function()
      require("neo-tree.command").execute({ action = "focus", reveal = true })
    end, {
    desc = "Reveal current file in Neo-tree",
    silent = true,
  })
end,
}
