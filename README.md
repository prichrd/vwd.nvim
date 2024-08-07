# vwd.nvim
A Virtual working directory for Neovim.

## Features

This plugin aims to provide a Virtual Working Directory (VWD) to use with
other plugins. When working with large repositories, targeting searches to
specific directories becomes essential. This plugin exposes an API and
commands to set, get and reset the working directory. It also provides a
Telescope extension to search from the VWD.

## Installing

Install the plugin with your preferred package manager:

<details>
<summary><a href="https://github.com/folke/lazy.nvim">lazy.nvim</a></summary>
<code>{ 'prichrd/vwd.nvim', opts = {} }</code>
</details>

<details>
<summary><a href="https://github.com/junegunn/vim-plug">vim-plug</a></summary>
<code>Plug 'prichrd/vwd.nvim'</code>
</details>

<details>
<summary><a href="https://github.com/wbthomason/packer.nvim">packer</a></summary>
<code>use 'prichrd/vwd.nvim'</code>
</details>


## Configuration

The plugin currently doesn't have any configuration options. The setup
function still has to be called to configure the commands:

```lua
  require('vwd').setup({})
```

### Telescope

vwd.nvim extends Telescope's `find_files`, `live_grep` and `grep_string`
functionalities by setting the CWD to the VWD. Here is a sample Telescope
configuration:

```lua
  local telescope = require('telescope')

  -- Register the vwd extension.
  telescope.load_extension('vwd')

  -- Configures find_files, live_grep and grep_string to use VWD. You can still provide
  -- regular Telescope arguments to the finders.
  vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>lua require"telescope".extensions.vwd.find_files({})<CR>', opts)
  vim.api.nvim_set_keymap('n', '<Leader>fg', '<cmd>lua require"telescope".extensions.vwd.live_grep({})<CR>', opts)
  vim.api.nvim_set_keymap('n', '<Leader>fs', '<cmd>lua require"telescope".extensions.vwd.grep_string({})<CR>', opts)
```

## Usage

### Commands

Get the VWD with:
```
:VWD get
```

Set the VWD with:
```
:VWD set {vwd}
```

Reset the VWD with:
```
:VWD reset
```

### API

Get the VWD with:
```lua
require('vwd').get_vwd()
```

Set the VWD with:
```lua
require('vwd').set_vwd(vwd, absolute)
```

Reset the VWD with:
```lua
require('vwd').reset_vwd()
```

## Contributing

This project accepts contributions. Feel free to open issues for questions, feature ideas, bugs, etc.
Before submitting a PR, make sure you run `make lint` with `stylua` and `luacheck` installed.
