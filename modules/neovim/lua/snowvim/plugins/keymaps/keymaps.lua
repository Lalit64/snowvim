-- Helper function for key mappings
local function map(mode, keys, action, desc, isRemap)
  desc = desc or " "
  remap = remap or false
  local opts = { noremap = true, silent = true, desc = desc, remap = isRemap }
  vim.keymap.set(mode, keys, action, opts)
end

-- General
map("n", "<Up>", "<Nop>")
map("n", "<Left>", "<Nop>")
map("n", "<Right>", "<Nop>")
map("n", "<Down>", "<Nop>")

map("i", "<C-b>", "<ESC>^i", "move beginning of line")
map("i", "<C-e>", "<End>", "move end of line")
map("i", "<C-h>", "<Left>", "move left")
map("i", "<C-l>", "<Right>", "move right")
map("i", "<C-j>", "<Down>", "move down")
map("i", "<C-k>", "<Up>", "move up")

map("n", "<C-h>", "<C-w>h", "switch window left")
map("n", "<C-l>", "<C-w>l", "switch window right")
map("n", "<C-j>", "<C-w>j", "switch window down")
map("n", "<C-k>", "<C-w>k", "switch window up")

map("n", "<Esc>", "<cmd>noh<CR>", "general clear highlights")

map("n", "<leader>/", "gcc", "Toggle Comment", true)
map("v", "<leader>/", "gc", "Toggle Comment", true)

-- LSP
map("n", "<leader>ct", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", "[C]ode [T]rouble diagnostics")
map("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
map("n", "gd", vim.lsp.buf.declaration, "[g]oto [d]eclaration")
map("n", "gD", vim.lsp.buf.definition, "[G]oto [D]efinition")
map("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame Symbol")

map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, "[F]or[m]at File")

-- Snacks Picker
map("n", "<leader>fh", Snacks.picker.help, "[F]ind [H]elp")
map("n", "<leader>fk", Snacks.picker.keymaps, "[F]ind [K]eymaps")
map("n", "<leader>ff", Snacks.picker.files, "[F]ind [F]iles")
map("n", "<leader>fw", Snacks.picker.grep, "[F]ind [W]ords")
map("n", "<leader>fd", Snacks.picker.diagnostics, "[F]ind [D]iagnostics")
map("n", "<leader>fr", Snacks.picker.resume, "[F]ind [R]esume")
map("n", "<leader>fi", Snacks.picker.icons, "[F]ind [I]cons")
map("n", "<leader>f.", Snacks.picker.recent, '[F]ind Recent Files ("." for repeat)')
map("n", "<leader>n", Snacks.picker.notifications, "[N]otification History")
map("n", "<leader>fu", Snacks.picker.undo, "[U]ndo History")

-- Misc
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", "NvimTree Toggle")
map("n", "<leader>re", "<cmd>NvimTreeResize 36<CR>", "NvimTree Resize")

map("n", "<leader>lg", function()
  Snacks.lazygit.open()
end, "[L]azy[G]it")
map({ "n", "t" }, "<C-t>", function()
  Snacks.terminal.toggle()
end, "Terminal")

-- Bufferline
map("n", "<leader>b", "<cmd>enew<CR>", "New buffer")
map("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", "Go to next buffer")
map("n", "<S-tab>", "<cmd>BufferLineCyclePrev<cr>", "Go to prev buffer")
map("n", "q", function()
  Snacks.bufdelete()
end, "Close buffer")
