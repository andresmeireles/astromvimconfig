local M = {}

M.getProjectFile = function()
  local path = vim.fn.getcwd()
  local project_name = vim.fn.fnamemodify(path, ":t")
  return pcall(require, "user.project." .. project_name)
end

return M
