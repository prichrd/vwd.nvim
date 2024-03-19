all: lint

.PHONY: luacheck
luacheck:
	luacheck .

.PHONY: format
format:
	stylua .

.PHONY: stylua
stylua:
	stylua --check .

.PHONY: lint
lint: stylua luacheck
