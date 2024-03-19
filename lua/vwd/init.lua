local M = {}

M.setup = require("vwd.config").setup
M.set_vwd = require("vwd.store").set_vwd
M.get_vwd = require("vwd.store").get_vwd
M.reset_vwd = require("vwd.store").reset_vwd

return M
