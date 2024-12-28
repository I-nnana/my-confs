vim.cmd [[colorscheme retrobox]]

-- set line number
vim.opt.number = true

--set vertical & horizontal line cursor
vim.opt.cursorline = true
vim.opt.cuc = true

-- set block cursor when in insert mode
vim.opt.guicursor="i:block"

-- hide cursor mode
--vim.opt.showmode = false 

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- enable break indent
-- linebreak preserves word when jumping to next line
vim.opt.breakindent = true
vim.opt.linebreak = true

-- Save undo history
vim.opt.undofile = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 20

-- do not open files matching extensions below
vim.opt.wildignore='*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx'

-- automatically indentds
vim.opt.shiftwidth = 4

-- number os space a tab does
vim.opt.tabstop = 4

-- show opening bracket when inserting closing one
vim.opt.showmatch = true

-- used for command line completion
vim.opt.wildmenu = true


-- [[ Keymaps ]] ------------------------------------------------------

-- set leader key
vim.g.mapleader = ";"

-- remove seach highlight
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- telescope keymap
--local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })


-- [[ statusline ]] ------------------------------------------------------

vim.opt.statusline = "%F %M %Y %R %p%%"
vim.opt.laststatus = 2

-- [[ plug ]] ------------------------------------------------------

vim.cmd [[
  call plug#begin('~/.local/share/nvim/plugged')
	Plug 'tpope/vim-sensible'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
	Plug 'nvim-tree/nvim-web-devicons'
  call plug#end()
]]
