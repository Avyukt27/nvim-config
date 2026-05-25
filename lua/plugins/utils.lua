local utils_dir = vim.fn.stdpath 'config' .. '/lua/plugins/utils'
local specs = {}
local handle = vim.loop.fs_scandir(utils_dir)

if handle then
  while true do
    local name, fs_type = vim.loop.fs_scandir_next(handle)
    if not name then
      break
    end

    if fs_type == 'file' and name:match '%.lua$' then
      local module_name = name:sub(1, -5)
      local require_path = 'plugins.utils.' .. module_name
      local ok, plugin_spec = pcall(require, require_path)

      if ok and type(plugin_spec) == 'table' then
        if plugin_spec[1] ~= nil or plugin_spec.dir ~= nil then
          table.insert(specs, plugin_spec)
        else
          for _, sub_spec in ipairs(plugin_spec) do
            table.insert(specs, sub_spec)
          end
        end
      else
        vim.notify('Error loading specification: ' .. require_path, vim.log.level.WARN)
      end
    end
  end
end

return specs
