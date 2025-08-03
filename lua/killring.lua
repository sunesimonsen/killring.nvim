---@class KillRingClass
---@field ring string[] List of kill ring items.
---@field max_size number Maximum number of items to store.
local KillRing = {
  ring = {},
  max_size = 20,
}

---Adds a new item to the kill ring.
---Duplicates are removed.
---@param item string
function KillRing:add(item)
  if item == nil or item == "" then
    return
  end
  -- Remove duplicates
  for i = #self.ring, 1, -1 do
    if self.ring[i] == item then
      table.remove(self.ring, i)
    end
  end
  table.insert(self.ring, 1, item)
  if #self.ring > self.max_size then
    table.remove(self.ring)
  end
end

---Returns all items in the kill ring.
---@return string[]
function KillRing:get_items()
  return self.ring
end

---Inserts the given item into the current buffer.
---@param item string
function KillRing:insert(item)
  -- Ensure that the buffer can be written to
  if vim.api.nvim_get_option_value("modifiable", { scope = "local" }) then
    vim.api.nvim_paste(item, true, -1)
  end
end

---Displays a picker to select and insert an item from the kill ring.
function KillRing:show_picker()
  local items = self:get_items()
  if #items == 0 then
    vim.notify("Kill ring is empty.", vim.log.levels.INFO)
    return
  end

  vim.ui.select(items, {
    prompt = "Select kill ring item:",
    format_item = function(item)
      -- Trim whitespace
      item = item:gsub("^%s*(.-)%s*$", "%1")

      -- Shorten long items for display
      if #item > 60 then
        return item:sub(1, 57) .. "..."
      else
        return item
      end
    end,
  }, function(choice)
    if choice then
      KillRing:insert(choice)
    end
  end)
end

---Configures the KillRing.
---@param opts? { max_size?: number }
function KillRing.setup(opts)
  opts = opts or {}
  if opts.max_size and type(opts.max_size) == "number" then
    KillRing.max_size = opts.max_size
  end

  vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
      local reg_contents = vim.fn.getreg('"')
      if reg_contents ~= nil and reg_contents ~= "" then
        KillRing:add(reg_contents)
      end
    end,
  })

  vim.api.nvim_create_user_command("KillRing", function()
    KillRing:show_picker()
  end, { desc = "View yank history" })
end

return KillRing
