-- Test script to verify Avante key mappings work correctly
-- Run this with :luafile test_keymaps.lua in Neovim

print("Testing Avante key mappings...")

-- Test if Avante is loaded
local avante_ok, avante = pcall(require, "avante")
if not avante_ok then
  print("❌ Avante not loaded")
  return
else
  print("✅ Avante loaded successfully")
end

-- Test if config is accessible
local config_ok, config = pcall(require, "avante.config")
if not config_ok then
  print("❌ Avante config not accessible")
  return
else
  print("✅ Avante config accessible")
  print("Current mode: " .. (config.mode or "unknown"))
end

-- Test key mappings
local function test_keymap(key, desc)
  local maps = vim.api.nvim_get_keymap('n')
  for _, map in ipairs(maps) do
    if map.lhs == key then
      print("✅ Key mapping found: " .. key .. " -> " .. desc)
      return true
    end
  end
  print("❌ Key mapping missing: " .. key .. " -> " .. desc)
  return false
end

print("\nTesting key mappings:")
test_keymap("<leader>aa", "avante: ask")
test_keymap("<leader>ar", "avante: refresh")
test_keymap("<leader>at", "avante: toggle")
test_keymap("<leader>a?", "avante: select mode")

-- Test which-key integration
local wk_ok, wk = pcall(require, "which-key")
if wk_ok then
  print("✅ Which-key loaded")
  -- Check if our Avante mappings are registered
  if wk.cache then
    print("Which-key cache exists")
  end
else
  print("❌ Which-key not loaded")
end

print("\nTest completed. If you see any ❌ marks, there may be issues with the configuration.")
print("To test mode switching manually, try pressing <leader>a? in normal mode.")
