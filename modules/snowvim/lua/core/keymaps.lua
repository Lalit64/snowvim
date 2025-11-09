local M = {}
local map = require("core.utils").map

M.inital = function()
  map("i", "jk", "<Esc>")

  map({ "n", "i" }, "<Up>", "<Nop>")
  map({ "n", "i" }, "<Left>", "<Nop>")
  map({ "n", "i" }, "<Right>", "<Nop>")
  map({ "n", "i" }, "<Down>", "<Nop>")
  map({ "n", "i" }, "<Down>", "<Nop>")

  map("n", "<space>", "<Nop>")
  map("x", "<space>", "<Nop>")

  map("i", "<C-b>", "<ESC>^i")
  map("i", "<C-e>", "<End>")
  map("i", "<C-h>", "<Left>")
  map("i", "<C-l>", "<Right>")
  map("i", "<C-j>", "<Down>")
  map("i", "<C-k>", "<Up>")

  map("n", "[[", "<Nop>")
  map("n", "]]", "<Nop>")
  map("n", ")", "<Nop>")
  map("n", "(", "<Nop>")

  -- avoid command history
  map("n", "q:", ":q<cr>")
  -- no `q` for macro
  map("n", "q", "<nop>")
  map("n", "ZZ", "<nop>")

  map("n", "~", "<Nop>")
  map("n", "g~", "<Nop>")
  map("n", "gu", "<nop>")
  map("n", "gU", "<nop>")

  map("n", "~", "<Nop>")

  map("n", "<Esc>", "<cmd>noh<CR>")

  -- auto indent on <tab>
  map("i", "<tab>", function()
    local _, col = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_get_current_line()

    -- this assume that "!^F" is in the "indentkeys" option
    if vim.o.indentexpr ~= "" and col == 0 and line:match "^%s*$" then
      local ctrl_f = vim.api.nvim_replace_termcodes("<c-f>", true, false, true)
      vim.api.nvim_feedkeys(ctrl_f, "n", false)
    else
      local tab = vim.api.nvim_replace_termcodes("<tab>", true, false, true)
      vim.api.nvim_feedkeys(tab, "n", false)
    end
  end)
end

M.final = function()
  map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

  map("n", "<leader>fh", Snacks.picker.help, { desc = "[F]ind [H]elp" })
  map("n", "<leader>fk", Snacks.picker.keymaps, { desc = "[F]ind [K]eymaps" })
  map("n", "<leader>ff", Snacks.picker.files, { desc = "[F]ind [F]iles" })
  map("n", "<leader>fw", Snacks.picker.grep, { desc = "[F]ind [W]ords" })
  map("n", "<leader>fd", Snacks.picker.diagnostics, { desc = "[F]ind [D]iagnostics" })
  map("n", "<leader>fs", Snacks.picker.lsp_symbols, { desc = "[F]ind [S]symbols" })
  map("n", "<leader>fr", Snacks.picker.resume, { desc = "[F]ind [R]esume" })
  map("n", "<leader>fi", Snacks.picker.icons, { desc = "[F]ind [I]cons" })
  map("n", "<leader>f.", Snacks.picker.recent, { desc = '[F]ind Recent Files ("." for repeat)' })
  map("n", "<leader>n", Snacks.picker.notifications, { desc = "[N]otification History" })
  map("n", "<leader>fu", Snacks.picker.undo, { desc = "[U]ndo History" })

  map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "NvimTree Toggle" })
  map("n", "<leader>re", "<cmd>NvimTreeResize 36<CR>", { desc = "NvimTree Resize" })

  map("n", "<leader>b", "<cmd>enew<CR>", { desc = "New buffer" })
  map("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Go to next buffer" })
  map("n", "<S-tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Go to prev buffer" })
  map("n", "q", function()
    Snacks.bufdelete()
  end, { desc = "Close buffer" })

  map("v", "<leader>/", "gc", { remap = true })
  map("n", "<leader>/", "gcc", { remap = true }) -- Use with leader n to comment n lines

  map("n", "<leader>lg", function()
    Snacks.lazygit.open()
  end, { desc = "[L]azy[G]it" })

  map({ "n", "t" }, "<C-t>", function()
    Snacks.terminal.toggle "zsh"
  end, { desc = "Terminal" })

  local surrounds = { '"', "'", "(", "[", "{", "<", "`", "t" }
  for _, char in ipairs(surrounds) do
    map("v", char, function()
      vim.api.nvim_feedkeys("sa" .. char, "v", true)
    end, { desc = "Surround selection with " .. char })
  end
end

return M
