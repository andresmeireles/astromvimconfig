return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require "dap"

    dap.adapters.php = {
      type = "executable",
      command = "node",
      args = { os.getenv("HOME") .. ".local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js" }
    }

    local ok, project = require('user.utils').getProjectFile()
    if ok then
      if project.dap ~= nil then
        project.dap(dap)
      end
    end
  end
}
