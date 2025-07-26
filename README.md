# killring.nvim

Paste previously yanked or deleted content from a Telescope picker.

## Installation

Install with [lazy.nvim](https://github.com/folke/lazy.nvim) with a kill ring of
size 20:

```lua
{
  "sunesimonsen/killring.nvim",
}
```

If you want to change the default size of the kill ring you can configure the
plugin:

```lua
{
  "sunesimonsen/killring.nvim",
  config = function()
    require("killring").setup({
      max_size = 50,
    })
  end
}
```

## Usage

As you edit your files, you can use
[Telescope](https://github.com/nvim-telescope/telescope.nvim) to paste any of
the previously yanked or deleted content using `:KillRing`

## License

[MIT © Sune Simonsen](./LICENSE)
