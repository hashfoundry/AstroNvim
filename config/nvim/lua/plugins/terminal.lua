-- Terminal Configuration for AstroNvim
return {
  -- Enhanced ToggleTerm configuration
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      persist_mode = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      auto_scroll = true,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
        width = function()
          return math.floor(vim.o.columns * 0.8)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.8)
        end,
      },
      winbar = {
        enabled = false,
        name_formatter = function(term)
          return term.name
        end,
      },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)
      
      local Terminal = require("toggleterm.terminal").Terminal
      
      -- Floating terminal
      local float_term = Terminal:new({
        direction = "float",
        float_opts = {
          border = "double",
          width = function()
            return math.floor(vim.o.columns * 0.9)
          end,
          height = function()
            return math.floor(vim.o.lines * 0.9)
          end,
        },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
        end,
      })
      
      -- Horizontal terminal
      local horizontal_term = Terminal:new({
        direction = "horizontal",
        size = 15,
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
        end,
      })
      
      -- Vertical terminal
      local vertical_term = Terminal:new({
        direction = "vertical",
        size = vim.o.columns * 0.4,
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
        end,
      })
      
      -- Node.js REPL terminal
      local node_repl = Terminal:new({
        cmd = "node",
        direction = "float",
        float_opts = {
          border = "double",
          title = "Node.js REPL",
          title_pos = "center",
        },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
        end,
        on_close = function()
          vim.cmd("startinsert!")
        end,
      })
      
      -- NPM terminal
      local npm_terminal = Terminal:new({
        direction = "horizontal",
        size = 15,
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
          -- Send npm help command on open
          vim.defer_fn(function()
            term:send("npm --help")
          end, 100)
        end,
      })
      
      -- Lazygit terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        direction = "float",
        float_opts = {
          border = "none",
          width = function()
            return vim.o.columns
          end,
          height = function()
            return vim.o.lines
          end,
        },
        on_open = function()
          vim.cmd("startinsert!")
        end,
        on_close = function()
          vim.cmd("startinsert!")
        end,
      })
      
      -- Key mappings for different terminals
      vim.keymap.set("n", "<leader>tf", function() float_term:toggle() end, { desc = "Toggle floating terminal" })
      vim.keymap.set("n", "<leader>th", function() horizontal_term:toggle() end, { desc = "Toggle horizontal terminal" })
      vim.keymap.set("n", "<leader>tv", function() vertical_term:toggle() end, { desc = "Toggle vertical terminal" })
      vim.keymap.set("n", "<leader>tn", function() node_repl:toggle() end, { desc = "Toggle Node.js REPL" })
      vim.keymap.set("n", "<leader>tm", function() npm_terminal:toggle() end, { desc = "Toggle NPM terminal" })
      vim.keymap.set("n", "<leader>tg", function() lazygit:toggle() end, { desc = "Toggle Lazygit" })
      
      -- Terminal navigation
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Terminal left window navigation" })
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Terminal down window navigation" })
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Terminal up window navigation" })
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Terminal right window navigation" })
      vim.keymap.set("t", "<C-/>", "<cmd>close<cr>", { desc = "Terminal close" })
    end,
  },

  -- Terminal integration improvements
  {
    "AstroNvim/astrocore",
    opts = {
      autocmds = {
        terminal_settings = {
          {
            event = "TermOpen",
            desc = "Terminal settings",
            callback = function()
              vim.opt_local.number = false
              vim.opt_local.relativenumber = false
              vim.opt_local.signcolumn = "no"
              vim.opt_local.foldcolumn = "0"
              vim.opt_local.winbar = ""
            end,
          },
        },
      },
      mappings = {
        n = {
          -- Terminal mappings
          ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
          ["<leader>t"] = { desc = "Terminal" },
          ["<leader>tt"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
          ["<leader>tT"] = { "<cmd>TermSelect<cr>", desc = "Select terminal" },
          ["<leader>ta"] = { "<cmd>ToggleTermToggleAll<cr>", desc = "Toggle all terminals" },
          ["<leader>ts"] = { "<cmd>TermSelect<cr>", desc = "Select terminal" },
        },
        t = {
          -- Terminal mode mappings
          ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
          ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), desc = "Terminal normal mode" },
        },
      },
    },
  },
}
