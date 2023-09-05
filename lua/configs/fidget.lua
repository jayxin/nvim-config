local M = {}

function M.config()
  local status_ok, _ = pcall(require, 'fidget')
  if not status_ok then return end

	_.setup({
		window = { blend = 0 },
	})
end

return M
