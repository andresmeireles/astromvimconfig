return {
  "gbprod/phpactor.nvim",
  -- build = require("phpactor.handler.update"), -- To install/update phpactor when installing this plugin
  dependecies = {
    "nvim-lua/plenary.nvim", -- required to update phpactor
    "neovim/nvim-lspconfig"  -- required to automaticly register lsp serveur
  },
  ft = "php",
  config = function()
    require("phpactor").setup({
      install = {
        path = os.getenv("HOME") .. "/.config/",
        bin = os.getenv("HOME") .. "/.config/phpactor/bin/phpactor",
      },
      lspconfig = {
        enabled = false
      }
    })
  end
}
