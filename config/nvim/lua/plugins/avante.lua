-- AI Assistant Configuration (Avante.nvim)
return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  build = "make",
  opts = {
    provider = "openai",
    auto_suggestions_provider = "openai",
    mode = "agentic", -- "agentic" | "legacy"
    providers = {
      openai = {
        endpoint = "https://openrouter.ai/api/v1",
        model = "anthropic/claude-sonnet-4",
        timeout = 30000,
        max_tokens = 20480,
        extra_request_body = {
          temperature = 0,
        },
      },
    },
    behaviour = {
      auto_suggestions = false,
      auto_set_highlight_group = true,
      auto_set_keymaps = false, -- Отключаем автоматические клавиши
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },
    mappings = {
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = "]x",
        prev = "[x",
      },
      suggestion = {
        accept = "<M-l>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      sidebar = {
        apply_all = "A",
        apply_cursor = "a",
        switch_windows = "<Tab>",
        reverse_switch_windows = "<S-Tab>",
      },
    },
    hints = { enabled = true },
    windows = {
      position = "right",
      wrap = true,
      width = 30,
      sidebar_header = {
        align = "center",
        rounded = true,
      },
    },
    highlights = {
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },
    diff = {
      autojump = true,
      list_opener = "copen",
    },
    -- Custom tools for Node.js development
    tools = {
      {
        name = "run_node_code",
        description = "Execute Node.js code snippet",
        command = function(code)
          local temp_file = vim.fn.tempname() .. ".js"
          local file = io.open(temp_file, "w")
          if file then
            file:write(code)
            file:close()
            local result = vim.fn.system("node " .. temp_file)
            vim.fn.delete(temp_file)
            return result
          end
          return "Error: Could not create temporary file"
        end,
      },
      {
        name = "run_node_file",
        description = "Execute current Node.js file",
        command = function()
          local current_file = vim.fn.expand("%:p")
          if vim.fn.fnamemodify(current_file, ":e") == "js" or vim.fn.fnamemodify(current_file, ":e") == "ts" then
            return vim.fn.system("node " .. current_file)
          end
          return "Error: Current file is not a JavaScript/TypeScript file"
        end,
      },
      {
        name = "run_npm_command",
        description = "Execute npm command in current directory",
        command = function(cmd)
          return vim.fn.system("npm " .. cmd)
        end,
      },
    },
  },
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  keys = {
    -- Основные функции
    {
      "<leader>aa",
      "<cmd>AvanteAsk<cr>",
      desc = "avante: ask",
      mode = { "n", "v" },
    },
    {
      "<leader>ar",
      "<cmd>AvanteRefresh<cr>",
      desc = "avante: refresh",
      mode = "n",
    },
    {
      "<leader>ae",
      "<cmd>AvanteEdit<cr>",
      desc = "avante: edit",
      mode = "v",
    },
    {
      "<leader>at",
      "<cmd>AvanteToggle<cr>",
      desc = "avante: toggle",
      mode = "n",
    },

    -- Управление файлами и буферами
    {
      "<leader>aB",
      function()
        -- Add all open buffers to chat context
        vim.cmd("AvanteChat")
        vim.notify("All open buffers added to context")
      end,
      desc = "avante: add all open buffers",
      mode = "n",
    },
    {
      "<leader>ac",
      function()
        -- Add current buffer to chat context
        vim.cmd("AvanteChat")
        vim.notify("Current buffer added to context")
      end,
      desc = "avante: add current buffer to file selection",
      mode = "n",
    },
    {
      "<leader>aC",
      function()
        -- Toggle selection (placeholder for future implementation)
        vim.notify("Toggle selection - feature not yet implemented")
      end,
      desc = "avante: toggle selection",
      mode = "n",
    },

    -- Режимы и настройки
    {
      "<leader>ad",
      function()
        -- Toggle debug mode (placeholder)
        vim.notify("Debug mode toggle - feature not yet implemented")
      end,
      desc = "avante: toggle debug",
      mode = "n",
    },
    {
      "<leader>as",
      function()
        -- Toggle suggestions
        local config = require("avante.config")
        local current = config.behaviour.auto_suggestions
        require("avante.config").override({
          behaviour = { auto_suggestions = not current }
        })
        vim.notify("Auto suggestions: " .. (not current and "enabled" or "disabled"))
      end,
      desc = "avante: toggle suggestion",
      mode = "n",
    },
    {
      "<leader>a?",
      function()
        -- Toggle between agentic and legacy modes
        local config = require("avante.config")
        local current_mode = config.mode
        local new_mode = current_mode == "agentic" and "legacy" or "agentic"
        require("avante.config").override({ mode = new_mode })
        vim.notify("Avante mode switched to: " .. new_mode)
      end,
      desc = "avante: select mode",
      mode = "n",
    },

    -- Навигация и управление
    {
      "<leader>af",
      "<cmd>AvanteFocus<cr>",
      desc = "avante: focus",
      mode = "n",
    },
    {
      "<leader>ah",
      "<cmd>AvanteHistory<cr>",
      desc = "avante: select history",
      mode = "n",
    },
    {
      "<leader>an",
      "<cmd>AvanteChatNew<cr>",
      desc = "avante: create new task",
      mode = "n",
    },
    {
      "<leader>aR",
      "<cmd>AvanteShowRepoMap<cr>",
      desc = "avante: display repo map",
      mode = "n",
    },
    {
      "<leader>aS",
      "<cmd>AvanteStop<cr>",
      desc = "avante: stop",
      mode = "n",
    },
  },
}
