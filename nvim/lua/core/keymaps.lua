vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
keymap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
-- Normal --
-- Open Link in Browser
keymap("n", "gx", "<cmd>execute '!xdg-open ' .. shellescape(expand('<cfile>'), v:true ) .. '&'<CR>", opts)
-- clear text highlighting
keymap("n", "<Esc>", "<cmd>noh<CR>", opts)
keymap("n", "<leader>th", "<cmd>noh<CR>", vim.tbl_extend("force", opts, { desc = "Toggle [H]ighlighting" }))
-- toggle line wrap
-- keymap("n", "<leader>tw", "<cmd>lua vim.wo.wrap = not vim.wo.wrap<CR>", opts)
keymap("n", "<leader>tw", "<cmd>set wrap!<CR>", vim.tbl_extend("force", opts, { desc = "Toggle Line [W]rap" }))
-- increment/decrement numbers
keymap("n", "<leader>+", "<C-a>", vim.tbl_extend("force", opts, { desc = "Increment Number" })) -- increment
keymap("n", "<leader>-", "<C-x>", vim.tbl_extend("force", opts, { desc = "Decrement Number" })) -- decrement
-- delete single character without copying into register
keymap("n", "x", '"_x', opts)
-- Better text / line navigation
-- Allow moving the cursor through wrapped lines with j, k
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- vertical scroll and center
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
-- find and center
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)
-- handy shotcut to jump to beginning and end of line
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)
-- Quick Actions
-- save
keymap("n", "<leader>w", ":w<CR>", vim.tbl_extend("force", opts, { desc = "[W]rite Buffer/File" }))
-- quit
keymap("n", "<leader>q", ":q!<CR>", vim.tbl_extend("force", opts, { desc = "[Q]uit!" }))
-- Replace word under cursor
keymap("n", "<leader>r", "*``cgn", vim.tbl_extend("force", opts, { desc = "[R]eplace Cursor Word" }))
-- Buffers
-- Navigate buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<leader>bc", "<cmd>bdelete!<CR>", vim.tbl_extend("force", opts, { desc = "[C]lose" })) -- close buffer
keymap("n", "<leader>bo", "<cmd>enew<CR>", vim.tbl_extend("force", opts, { desc = "[O]pen" })) -- new buffer
-- Tabs
keymap("n", "<leader>to", "<cmd>tabnew %<CR>", vim.tbl_extend("force", opts, { desc = "Tab [O]pen" })) -- open new tab
keymap("n", "<leader>tc", "<cmd>tabclose<CR>", vim.tbl_extend("force", opts, { desc = "Tab [C]lose" })) -- close current tab
keymap("n", "<leader>tn", "<cmd>tabn<CR>", vim.tbl_extend("force", opts, { desc = "Tab [N]ext" })) --  go to next tab
keymap("n", "<leader>tp", "<cmd>tabp<CR>", vim.tbl_extend("force", opts, { desc = "Tab [P]rev" })) --  go to previous tab
-- Windows
-- window management
keymap("n", "<leader>wv", "<cmd>vsplit<CR>", vim.tbl_extend("force", opts, { desc = "Split [V]ertical" })) -- split window vertically
keymap("n", "<leader>wh", "<cmd>split<CR>", vim.tbl_extend("force", opts, { desc = "Split [H]orizontal" })) -- split window horizontally
keymap("n", "<leader>we", "<C-w>=", vim.tbl_extend("force", opts, { desc = "[E]qual" })) -- make split windows equal width & height
keymap("n", "<leader>wc", "<cmd>close<CR>", vim.tbl_extend("force", opts, { desc = "[C]lose" })) -- close current split window
-- Resize with arrows
keymap("n", "<Up>", ":resize -2<CR>", opts)
keymap("n", "<Down>", ":resize +2<CR>", opts)
keymap("n", "<Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<Right>", ":vertical resize +2<CR>", opts)
-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
-- Save and load session
keymap("n", "<leader>ss", "<cmd>mksession!<CR>", vim.tbl_extend("force", opts, { desc = "[S]ave" }))
keymap("n", "<leader>sl", "<cmd>source Session.vim<CR>", vim.tbl_extend("force", opts, { desc = "[L]oad" }))
-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)
-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)
-- Move text up and down
keymap({ "v", "x" }, "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap({ "v", "x" }, "<A-k>", ":m '<-2<CR>gv=gv", opts)
-- Keep last yanked when pasting
keymap({ "v", "x" }, "p", [["_dP]], opts)

-- Checking and further investigation
-- vim.keymap.set('n', '<leader>do', function()
--   diagnostics_active = not diagnostics_active
--
--   if diagnostics_active then
--     vim.diagnostic.enable(0)
--   else
--     vim.diagnostic.disable(0)
--   end
-- end)
--
-- -- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
--
