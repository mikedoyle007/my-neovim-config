local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<ALT-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<ALT-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press kj or jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Maintains yanked register when pasting over another word
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope --
-- Find file name
keymap("n", "<C-p>", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", opts)
-- Grep word in files with live_grep
-- keymap("n", "<C-f>", "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown{previewer = false})<cr>", opts)
keymap("n", "<C-f>", "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy())<cr>", opts)
-- Custom for config files
keymap("n", "<leader>sd", "<cmd>lua require('user.customTelescope').edit_neovim()<cr>", opts)
-- Fuzzy Find - Current Buffer ( <C-/>)
keymap("n", "<C-_>", "<cmd>lua require('user.customTelescope').curr_buff()<cr>", opts)

-- Vim Fugitive --
-- keymap("n", "<leader>gs", ":G<CR>", opts)

-- Neogit --
keymap("n", "<leader>gs", ":Neogit<CR>", opts)

-- Diffview --
-- keymap("n", "<C-S-G>", ":DiffviewOpen<CR>", opts)
-- I have this mapped in whichkey as well, keeping this as a backup
keymap("n", "<C-g>", ":DiffviewClose<CR>", opts)

-- Quickly save and execute (source) a file
keymap("n", "<leader>x", ":wa<CR>:so %<CR>", opts)

-- Bufferline Close a buffer
keymap("n", "<leader>w", ":bd<CR>", opts)

-- Goto previous file
-- TODO: preserve position
keymap("n", "<leader>p", "<C-^><CR>", opts)

-- Reload init.lua
-- TODO: This is not reloading currently because package.loaded.customTelescope is already nil
keymap("n", "<F4>", ":lua package.loaded.customTelescope = nil <cr>:source ~/.config/nvim/init.lua<cr>", opts)

-- Dummy keymap to test with
keymap("n", "<leader><leader>h", "echo 'I am a test keymap'", opts)


