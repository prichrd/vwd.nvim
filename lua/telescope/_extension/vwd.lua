local builtin = require("telescope.builtin")
local vwd = require("vwd")

local find_files = function(opts)
	opts = opts or {}
	opts.cwd = vwd.get_vwd()
	builtin.find_files(opts)
end

local live_grep = function(opts)
	opts = opts or {}
	opts.cwd = vwd.get_vwd()
	builtin.live_grep(opts)
end

local file_browser = function(opts)
	opts = opts or {}
	opts.cwd = vwd.get_vwd()
	require("telescope").extensions.file_browser.file_browser(opts)
end

return require("telescope").register_extension({
	exports = {
		find_files = find_files,
		live_grep = live_grep,
		file_browser = file_browser,
		actions = require("telescope._extensions.vwd.actions"),
	},
})
