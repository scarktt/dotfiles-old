local is_ok, notify = pcall(require, "notify")
if not is_ok then
  print('Not notify')
  return
end

vim.notify = notify
