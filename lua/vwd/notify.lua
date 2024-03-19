local M = {}

local prefix = "[VWD] "

local notify_fn = vim.notify

local print_cb = function(lvl, fmt, ...)
	notify_fn(prefix .. string.format(fmt, ...), lvl)
end

--- trace logs a TRACE message.
--- @param fmt string Template string (e.g. "hello %s")
--- @param ... any[] Variadic elements of the templated fmt.
M.trace = function(fmt, ...)
	print_cb(vim.log.levels.TRACE, fmt, ...)
end

--- debug logs a DEBUG message.
--- @param fmt string Template string (e.g. "hello %s")
--- @param ... any[] Variadic elements of the templated fmt.
M.debug = function(fmt, ...)
	print_cb(vim.log.levels.DEBUG, fmt, ...)
end

--- info logs a INFO message.
--- @param fmt string Template string (e.g. "hello %s")
--- @param ... any[] Variadic elements of the templated fmt.
M.info = function(fmt, ...)
	print_cb(vim.log.levels.INFO, fmt, ...)
end

--- warn logs a WARN message.
--- @param fmt string Template string (e.g. "hello %s")
--- @param ... any[] Variadic elements of the templated fmt.
M.warn = function(fmt, ...)
	print_cb(vim.log.levels.WARN, fmt, ...)
end

--- error logs a ERROR message.
--- @param fmt string Template string (e.g. "hello %s")
--- @param ... any[] Variadic elements of the templated fmt.
M.error = function(fmt, ...)
	print_cb(vim.log.levels.ERROR, fmt, ...)
end

return M
