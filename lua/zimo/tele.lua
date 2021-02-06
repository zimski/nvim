M = {}

function M.find_files_same_dir()
  require('telescope.builtin').find_files {
    cwd = vim.fn.expand('%:p:h')
  }
end

function M.hello()
  print "hello"
end

return M
