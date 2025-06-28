-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  spec = {
   
        -- colorscheme
        { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, 
            opts = { contrast = 'hard' }
        },

        -- bottom line
        { 'nvim-lualine/lualine.nvim', 
            dependencies = { 'nvim-tree/nvim-web-devicons' },
            opts = { theme = 'gruvbox_dark' }
        },

        -- telecope for live grep
        { 'nvim-telescope/telescope-project.nvim',
            dependencies = { 'nvim-telescope/telescope.nvim' },
        },

        -- mardown preview
        { 'MeanderingProgrammer/render-markdown.nvim',
            dependencies = { 'nvim-treesitter/nvim-treesitter', 
                'nvim-tree/nvim-web-devicons' 
            }, 
        },

        -- hex colorizer
        { 'norcalli/nvim-colorizer.lua' },

        -- git blame
        { "f-person/git-blame.nvim",
            event = "VeryLazy",
            opts = {
                enabled = true,  
                message_template = " <summary> • <date> • <author> • <<sha>>", 
                date_format = "%d/%m/%Y %H:%M", 
                virtual_text_column = 1,  
            },
        },
        
        -- nvim tree
        { "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "MunifTanjim/nui.nvim",
            },
            lazy = false, 
            opts = {
                window = {
                    ["P"] = {
                        "toggle_preview",
                        config = { user_float = false },
                    },
                },
                filesystem = {
                    filtered_items = {
                        visible = true, 
                        hide_dotfiles = false,
                        hide_gitignored = true,
                    },
                },
            },
        },

        -- which key
        { "folke/which-key.nvim",
            event = "VeryLazy",
            opts = {
                preset = "modern",
            },
        },

        -- alpha nvim
        { "goolord/alpha-nvim",
            config = function ()
                local alpha = require("alpha")
                local dashboard = require("alpha.themes.dashboard")

                -- Set header
                dashboard.section.header.val = {
                        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣶⠿⠿⠿⣶⣦⣀⠀⠀⠀    ]],
                        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠛⠉⠀⠀⠀⠀⠀⠀⠉⠻⣧⡀⠀    ]],
                        [[ ⢠⣄⣀⣀⣀⣀⣀⣀⣀⣴⠋⠀⠀⠀⠀⠀⣴⣆⠀⠀⠀⠀⠘⣿⡀    ]],
                        [[ ⠀⠙⠻⣿⣟⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀⠘⠿⠋⠀⠀⠀⠀⠀⣿⡇    ]],
                        [[ ⠀⠀⠀⠀⠙⢷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡇    ]],
                        [[ ⠀⠀⠀⠀⠀⠀⠘⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣽⠃    ]],
                        [[ ⠀⠀⠀⠀⠀⠀⢰⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀    ]],
                        [[ ⠀⠀⠀⠀⠀⠀⣾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡿⠀    ]],
                        [[ ⠀⠀⠀⠀⠀⢸⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠃⠀    ]],
                        [[ ⠀⠀⠀⠀⢀⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡟⠀⠀    ]],
                        [[ ⠀⠀⠀⠀⣾⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠇⠀⠀    ]],
                        [[                              ]],
                        [[          你好世界            ]],
                }

                -- Set menu
                dashboard.section.buttons.val = {
                    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
                    dashboard.button( "f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
                    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
                    dashboard.button( "g", "󱉟  > Find word"   , ":Telescope live_grep<CR>"),
                    dashboard.button( "s", "󰁯  > Old session"   , ":Autosession search<CR>"),
                    dashboard.button( "q", "󰩈  > Quit", ":qa<CR>"),
                }

                alpha.setup(dashboard.opts)

                -- Disable folding on alpha buffer
                vim.cmd([[
                    autocmd FileType alpha setlocal nofoldenable
                ]])
            end
        },

        -- auto session
        { 'rmagatti/auto-session',
            lazy = false,
            opts = {
                suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
                -- log_level = 'debug',
            }
        },

        -- automatically check for plugin updates
        checker = { enabled = true },
    }
})

-- basic confs ----------------------------------------------------------------
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")

vim.o.number = true        
vim.o.rnu = true        
vim.o.tabstop = 4           
vim.o.shiftwidth = 4         
vim.o.expandtab = true        
vim.o.cursorline = true        
vim.o.cuc = true
vim.o.guicursor = "i:block"     
vim.o.colorcolumn = "81"         
vim.o.breakindent = true          
vim.o.linebreak = true
vim.o.undofile = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff = 20
vim.o.wildignore= '*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,\
    *.xlsx'
vim.o.hidden = true
vim.o.wildmenu = true
vim.o.showmatch = true
vim.o.showmode = false
vim.o.tgc = true

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
 vim.o.clipboard = 'unnamedplus'
end)

-- keymaps --------------------------------------------------------------------

-- remove search highlight
vim.keymap.set('n', '<leader>x', '<cmd>nohlsearch<CR>')

-- telescope
vim.keymap.set("n", "<leader>b", '<cmd>Telescope buffers<CR>')
vim.keymap.set("n", "<leader>f", '<cmd>Telescope fd<CR>')
vim.keymap.set("n", "<leader>g", '<cmd>Telescope live_grep<CR>')

-- colorizer
vim.keymap.set("n", "<leader>z", '<cmd>ColorizerToggle<CR>')

-- neo-tree
vim.keymap.set("n", "<leader>t", '<cmd>Neotree toggle<CR>')

-- auto session
vim.keymap.set("n", "<leader>s", '<cmd>SessionSave<CR>')
vim.keymap.set("n", "<leader>?", '<cmd>Autosession search<CR>')
vim.keymap.set("n", "<leader>d", '<cmd>Autosession delete<CR>')
