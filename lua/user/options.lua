local options = {
  hidden = true,                           -- required to keep multiple buffers open
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = false,                        -- highlight all matches on previous search pattern
  incsearch = true,                        -- show search results with each keystroke
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  smartcase = true,                        -- smart case
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  smarttab = true,                         -- makes tabbing smarter, will realize you have 2 vs 4
  expandtab = true,                        -- convert tabs to spaces
  showtabline = 2,                         -- always show tabs
  tabstop = 2,                             -- insert 2 spaces for a tab
  smartindent = true,                      -- make indenting smarter again
  autoindent = true,                       -- good auto indent
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
  -- I added these...
  inccommand = "split",                       -- shows partial off-screen results in a preview window
  -- guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20",
  guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20",
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- Cool highlighting courtesy of @clason
vim.cmd [[augroup LuaHighlight]]
vim.cmd [[  au!]]
vim.cmd [[  au TextYankPost * silent! lua return (not vim.v.event.visual) and require'vim.highlight'.on_yank()]]
vim.cmd [[augroup END]]
