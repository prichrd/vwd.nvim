local M = {}

local command = require("vwd.command")
local notify = require("vwd.notify")

--- @class Config
local defaults = {}

--- @type Command
local cmd = {
	["set"] = function(...)
		local args = ...
		require("vwd").set_vwd(args[1])
		notify.info("VWD updated to '%s'", require("vwd").get_vwd())
	end,
	["get"] = function(...)
		notify.info("VWD is '%s'", require("vwd").get_vwd())
	end,
	["reset"] = function(...)
		require("vwd").reset_vwd()
		notify.info("VWD resetted to '%s'", require("vwd").get_vwd())
	end,
}

--- @type Config
M.options = {}

--- setup configures the plugin.
--- @param options Config|nil
function M.setup(options)
	M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
	vim.api.nvim_create_user_command("VWD", function(opts)
		local err = command.execute(cmd, opts.fargs)
		if err then
			notify.error("%s", err)
		end
	end, {
		nargs = "*",
		complete = function(_, line)
			return command.autocomplete(cmd, command.split(line))
		end,
	})
end

return M
