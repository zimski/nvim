local M = {}

M.R = function(package) {
  package.loaded[package] = nil
  return require(package)
}

return M
