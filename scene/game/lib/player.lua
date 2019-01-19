local M = {}

function M.new(instance, options)
	local scene = composer.getScene(composer.getSceneName("current"))
	options = options or {}
end

return M