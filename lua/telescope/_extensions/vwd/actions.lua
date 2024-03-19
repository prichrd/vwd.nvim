local M = {}

local manatee = require("manatee")

--- set_vwd makes the current Telescope picker the virtual working directory (VWD).
M.set_vwd = function(prompt_bufnr)
	local action_state = require("telescope.actions.state")
	local current_picker = action_state.get_current_picker(prompt_bufnr)
	manatee.set_vwd(current_picker.finder.path, true)
end

return M
