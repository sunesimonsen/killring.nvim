# killring.nvim

Paste previously yanked or deleted content from a Telescope picker.

https://github.com/user-attachments/assets/2f9f25c7-e271-48db-95d7-04d64b27b7d4

## Installation

```lua
return {
  'sunesimonsen/killring.nvim',
  opts = {
    max_size: 30 -- the size of the kill ring (defaults to 20)
  },
  keys = {
    { '<leader>yy', ':KillRing<CR>', desc = 'View yank history', mode = { 'n' } },
  },
  lazy = false,
}
```

## Usage

As you edit your files, you can use
[Telescope](https://github.com/nvim-telescope/telescope.nvim) to paste any of
the previously yanked or deleted content using `:KillRing`

## License

[MIT © Sune Simonsen](./LICENSE)
