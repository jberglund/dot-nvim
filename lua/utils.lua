local Path = require 'plenary.path'

local cmd = vim.cmd

local M = {}

function M.read_json_file(filename)
    local Path = require 'plenary.path'

    local path = Path:new(filename)
    if not path:exists() then return nil end

    local json_contents = path:read()
    local json = vim.fn.json_decode(json_contents)

    return json
end

function M.read_package_json() return M.read_json_file 'package.json' end

---Check if the given NPM package is installed in the current project.
---@param package string
---@return boolean
function M.is_npm_package_installed(package)
    local package_json = M.read_package_json()
    if not package_json then return false end

    if package_json.dependencies and package_json.dependencies[package] then
        return true
    end

    if package_json.devDependencies and package_json.devDependencies[package] then
        return true
    end

    return false
end

function M.on_attach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end,
  })
end

function M.has(plugin)
  return require("lazy.core.config").plugins[plugin] ~= nil
end

function M.opts(name)
  local plugin = require("lazy.core.config").plugins[name]
  if not plugin then
    return {}
  end
  local Plugin = require("lazy.core.plugin")
  return Plugin.values(plugin, "opts", false)
end

return M;
