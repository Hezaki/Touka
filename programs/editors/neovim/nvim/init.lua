
fn = vim.fn
api = vim.api
cmd = vim.cmd
opt = vim.opt
g = vim.g

_G.theme = "gruvbox"

local modules = {
  'options',
  'mappings',
  'statusline',
  'plugins',
  'colors',
}

for _, a in ipairs(modules) do
  local ok, err = pcall(require, a)
  if not ok then
    error("Error calling " .. a .. err)
  end
end
