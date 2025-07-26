# killring.nvim

Paste previously yanked or deleted content from a Telescope picker.

https://github.com/user-attachments/assets/2f9f25c7-e271-48db-95d7-04d64b27b7d4

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
