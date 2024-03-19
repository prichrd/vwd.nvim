local M = {}

M._state = {
	vwd = vim.fn.getcwd(),
}

--- set_vwd sets the VWD.
---@param dir string the directory to set as the VWD.
---@param absolute boolean Wether the provided dir is an absolute path or a CWD relative path.
M.set_vwd = function(dir, absolute)
	if absolute then
		M._state.vwd = dir
	else
		M._state.vwd = vim.fn.resolve(vim.fn.getcwd() .. "/" .. dir)
	end
end

--- get_vwd gets the currently set VWD.
---@return string
M.get_vwd = function()
	return M._state.vwd
end

--- reset_vwd resets the VWD to the CWD.
M.reset_vwd = function()
	M._state.vwd = vim.fn.getcwd()
end

return M
