local M = {}

M.sources = function(null_ls, path)
  local diagnostics = null_ls.builtins.diagnostics
  return {
    diagnostics.phpcs.with({
      prefer_local = "vendor/bin",
      args = { "--standard" .. path .. "/dev/tests/static/framework/Magento" }
    }),
    diagnostics.phpmd.with({
      prefer_local = "vendor/bin",
      args = {
        "$FILENAME",
        "json",
        path .. "/dev/tests/static/testsuite/Magento/Test/Php/_files/phpmd/ruleset.xml"
      }
    })
  }
end

return M
