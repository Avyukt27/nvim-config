local sections = {
  { section = 'header' },
  { section = 'keys', gap = 1, padding = 1 },
  { pane = 2, icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
  { pane = 2, icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
  {
    pane = 2,
    icon = ' ',
    title = 'Git Status',
    section = 'terminal',
    enabled = function()
      return Snacks.git.get_root() ~= nil
    end,
    cmd = 'git status --short --branch --renames',
    height = 5,
    padding = 1,
    ttl = 5 * 60,
    indent = 3,
  },
  { section = 'startup' },
}

return {
  enabled = true,
  preset = {
    header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
    keys = {
      { icon = ' ', key = 'f', desc = 'Find File', action = ':lua Snacks.picker.files()' },
      { icon = ' ', key = 'n', desc = 'New File', action = ':ene' },
      { icon = ' ', key = 'g', desc = 'Find Text', action = ':lua Snacks.picker.grep()' },
      { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.picker.files { cwd = vim.fn.stdpath 'config' }" },
      { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
      { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
    },
  },
  sections = sections,
}
