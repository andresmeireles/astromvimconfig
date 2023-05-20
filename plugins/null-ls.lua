local mergeTables = function(table1, table2)
  local mergedTable = {}

  -- Merge elements from the first table
  for _, value in pairs(table1) do
    table.insert(mergedTable, value)
  end

  -- Merge elements from the second table
  for _, value in pairs(table2) do
    table.insert(mergedTable, value)
  end

  return mergedTable
end

return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    local null_ls = require("null-ls")

    local path = vim.fn.getcwd()
    local project_name = vim.fn.fnamemodify(path, ":t")
    local ok, project_file = pcall(require, "user.project." .. project_name)
    local project_sources = {}
    if ok then
      project_sources = project_file.sources(null_ls, path)
    end

    local diagnostics = null_ls.builtins.diagnostics
    local actions = null_ls.builtins.code_actions

    local local_sources = {
      -- actions
      actions.cspell.with({
        config = {
          find_json = function(cwd)
            return vim.fn.expand(cwd .. "/.vscode/cspell.json")
          end
        }
      }),
      -- formatters
      -- diagnostics
      diagnostics.cspell,
    }

    local sources = mergeTables(local_sources, project_sources)

    config.sources = sources
  end
}
