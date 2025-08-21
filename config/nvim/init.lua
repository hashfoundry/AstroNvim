-- AstroNvim Configuration
-- Bootstrap AstroNvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup AstroNvim
require("config.lazy")

-- Fix key mapping conflicts with AstroNvim
vim.api.nvim_create_autocmd("User", {
  pattern = "AstroLspSetup",
  callback = function()
    -- Clear which-key cache to remove outdated suggestions
    local ok, wk = pcall(require, "which-key")
    if ok then
      -- Clear the cache
      if wk.cache then
        wk.cache = {}
      end
      -- Force reload of key mappings
      vim.schedule(function()
        wk.setup()
      end)
    end
  end,
})

-- Ensure Avante key mappings take priority
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  callback = function()
    -- Override any conflicting key mappings after all plugins are loaded
    vim.schedule(function()
      -- Force set Avante mode switching key
      vim.keymap.set("n", "<leader>a?", function()
        local config = require("avante.config")
        local current_mode = config.mode
        local new_mode = current_mode == "agentic" and "legacy" or "agentic"
        require("avante.config").override({ mode = new_mode })
        vim.notify("Avante mode switched to: " .. new_mode)
      end, { desc = "avante: select mode", silent = true })
      
      -- Clear which-key cache again after all plugins are loaded
      local ok, wk = pcall(require, "which-key")
      if ok then
        if wk.cache then
          wk.cache = {}
        end
        -- Re-register Avante key mappings with which-key
        wk.register({
          ["<leader>a"] = {
            name = "avante",
            a = { "<cmd>AvanteAsk<cr>", "ask" },
            r = { "<cmd>AvanteRefresh<cr>", "refresh" },
            e = { "<cmd>AvanteEdit<cr>", "edit" },
            t = { "<cmd>AvanteToggle<cr>", "toggle" },
            B = { function()
              vim.cmd("AvanteChat")
              vim.notify("All open buffers added to context")
            end, "add all open buffers" },
            c = { function()
              vim.cmd("AvanteChat")
              vim.notify("Current buffer added to context")
            end, "add current buffer to file selection" },
            C = { function()
              vim.notify("Toggle selection - feature not yet implemented")
            end, "toggle selection" },
            d = { function()
              vim.notify("Debug mode toggle - feature not yet implemented")
            end, "toggle debug" },
            s = { function()
              local config = require("avante.config")
              local current = config.behaviour.auto_suggestions
              require("avante.config").override({
                behaviour = { auto_suggestions = not current }
              })
              vim.notify("Auto suggestions: " .. (not current and "enabled" or "disabled"))
            end, "toggle suggestion" },
            ["?"] = { function()
              local config = require("avante.config")
              local current_mode = config.mode
              local new_mode = current_mode == "agentic" and "legacy" or "agentic"
              require("avante.config").override({ mode = new_mode })
              vim.notify("Avante mode switched to: " .. new_mode)
            end, "select mode" },
            f = { "<cmd>AvanteFocus<cr>", "focus" },
            h = { "<cmd>AvanteHistory<cr>", "select history" },
            n = { "<cmd>AvanteChatNew<cr>", "create new task" },
            R = { "<cmd>AvanteShowRepoMap<cr>", "display repo map" },
            S = { "<cmd>AvanteStop<cr>", "stop" },
          }
        })
      end
    end)
  end,
})

-- Additional autocmd to handle which-key conflicts
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    -- Ensure our key mappings are always active
    if vim.bo.filetype ~= "lazy" then
      vim.schedule(function()
        -- Re-set critical Avante key mappings
        vim.keymap.set("n", "<leader>a?", function()
          local config = require("avante.config")
          local current_mode = config.mode
          local new_mode = current_mode == "agentic" and "legacy" or "agentic"
          require("avante.config").override({ mode = new_mode })
          vim.notify("Avante mode switched to: " .. new_mode)
        end, { desc = "avante: select mode", silent = true })
      end)
    end
  end,
})
