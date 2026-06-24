local M = {}

---@param hex string e.g. "#101010"
---@return integer r, integer g, integer b
local function hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

---@param r integer
---@param g integer
---@param b integer
---@return string
local function rgb_to_hex(r, g, b)
  return string.format("#%02x%02x%02x", math.floor(r), math.floor(g), math.floor(b))
end

--- Blends two hex colors together.
--- @param fg string foreground hex
--- @param bg string background hex
--- @param alpha number 0..1, weight of fg
--- @return string hex
function M.blend(fg, bg, alpha)
  local fr, fg_, fb = hex_to_rgb(fg)
  local br, bg2, bb = hex_to_rgb(bg)
  return rgb_to_hex(
    br + (fr - br) * alpha,
    bg2 + (fg_ - bg2) * alpha,
    bb + (fb - bb) * alpha
  )
end

--- Deep merge override table into base table (in place semantics, returns new table).
---@param base table
---@param override table|nil
---@return table
function M.merge(base, override)
  local out = vim.deepcopy(base)
  if override then
    for k, v in pairs(override) do
      out[k] = v
    end
  end
  return out
end

--- Lighten a hex color toward white.
---@param hex string
---@param amount number 0..1
---@return string
function M.lighten(hex, amount)
  return M.blend("#ffffff", hex, amount)
end

--- Darken a hex color toward black.
---@param hex string
---@param amount number 0..1
---@return string
function M.darken(hex, amount)
  return M.blend("#000000", hex, amount)
end

return M
