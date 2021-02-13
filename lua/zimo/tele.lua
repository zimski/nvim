M = {}
local themes = require('telescope.themes')

function M.find_files_same_dir()
  require('telescope.builtin').find_files(themes.get_dropdown {
    cwd = vim.fn.expand('%:p:h'),
    previewer = false,
    winblend = 10
  })
end

function M.buffers()
  require('telescope.builtin').buffers(themes.get_dropdown {
    previewer = false,
    winblend = 10
  })
end

function M.hello()
  print "hello"
end

return M
