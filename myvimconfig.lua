-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[
     augroup Packer
       autocmd!
       autocmd BufWritePost init.lua PackerCompile
     augroup end
   ]]

local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim'          -- Package manager
    use 'neovim/nvim-lspconfig'           -- LSP
    use 'hrsh7th/nvim-cmp'                -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'            -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip'        -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip'                -- Snippets plugin
    use 'nvim-treesitter/nvim-treesitter' -- Treesitter for better syntax highlighting
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'kyazdani42/nvim-web-devicons' -- Icons
    use 'kyazdani42/nvim-tree.lua'     -- File explorer
    use 'lewis6991/gitsigns.nvim'      -- Git integration
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'p00f/nvim-ts-rainbow'         -- For colored brackets
    use 'windwp/nvim-autopairs'        -- For auto-completing brackets
    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"}
        }
    }
    use 'stevearc/conform.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
end)

-- Basic settings
vim.o.number = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.encoding = 'utf-8'

-- LSP configuration
local nvim_lsp = require('lspconfig')

-- Python LSP
nvim_lsp.pyright.setup {}

-- Autocompletion setup
local cmp = require 'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})

-- Treesitter configuration
require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "python" },
    highlight = {
        enable = true,
    },
}

-- Telescope configuration
local telescope = require('telescope')
telescope.setup {}

-- NvimTree configuration
require 'nvim-tree'.setup {}

-- Gitsigns configuration
require('gitsigns').setup()

-- Key mappings
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true }) -- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[
     augroup Packer
       autocmd!
       autocmd BufWritePost init.lua PackerCompile
     augroup end
   ]]

local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim'          -- Package manager
    use 'neovim/nvim-lspconfig'           -- LSP
    use 'hrsh7th/nvim-cmp'                -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'            -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip'        -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip'                -- Snippets plugin
    use 'nvim-treesitter/nvim-treesitter' -- Treesitter for better syntax highlighting
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'kyazdani42/nvim-web-devicons' -- Icons
    use 'kyazdani42/nvim-tree.lua'     -- File explorer
    use 'lewis6991/gitsigns.nvim'      -- Git integration
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'p00f/nvim-ts-rainbow'         -- For colored brackets
    use 'windwp/nvim-autopairs'        -- For auto-completing brackets
    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"}
        }
    }
    use 'stevearc/conform.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
end)

-- Basic settings
vim.o.number = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.encoding = 'utf-8'

-- LSP configuration
local nvim_lsp = require('lspconfig')

-- Python LSP
nvim_lsp.pyright.setup {}

-- Autocompletion setup
local cmp = require 'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})

-- Treesitter configuration
require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "python" },
    highlight = {
        enable = true,
    },
}

-- Telescope configuration
local telescope = require('telescope')
telescope.setup {}

-- NvimTree configuration
require 'nvim-tree'.setup {}

-- Gitsigns configuration
require('gitsigns').setup()

-- Key mappings
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })

-- Catppuccin theme setup
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = {     -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false,   -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- Setup colorscheme
vim.cmd.colorscheme "catppuccin"

-- Additional transparency settings
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })

-- Enable mode display in statusline
vim.opt.showmode = true

-- Make statusline always visible
vim.opt.laststatus = 2

-- Optionally, customize the statusline
vim.opt.statusline = [[%f %y %m %= %l:%c %p%%]]

-- Enable mode display
vim.opt.showmode = true

-- Ensure statusline is always visible
vim.opt.laststatus = 2

-- Customize statusline to show mode, file name, and position
vim.opt.statusline = [[%<%f %h%m%r%=%-14.(%l,%c%V%) %P %y %{mode()}]]

-- Treesitter configuration
require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "python" },
    highlight = {
        enable = true,
    },
    -- Add this configuration for rainbow parentheses
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}

-- Autopairs configuration
require('nvim-autopairs').setup({
    check_ts = true,
    ts_config = {
        lua = { 'string' },
        javascript = { 'template_string' },
        java = false,
    },
    disable_filetype = { "TelescopePrompt", "vim" },
})

-- If you want the pairs to auto-complete in certain contexts, add this:
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

-- Function to run Python files
function RunPythonFile()
    local file = vim.fn.expand('%:p')
    vim.cmd('below split | resize 15 | terminal python ' .. file)
end

-- Key mapping to run Python files
vim.api.nvim_set_keymap('n', '<F5>', ':lua RunPythonFile()<CR>', { noremap = true, silent = true })

-- Optional: Key mapping to close the terminal split
vim.api.nvim_set_keymap('n', '<F6>', ':bdelete!<CR>', { noremap = true, silent = true })

-- Terminal settings
vim.cmd('autocmd TermOpen * setlocal nonumber norelativenumber')
vim.cmd('autocmd TermOpen * startinsert')

-- Set split preferences
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Function to create a border
local function create_border()
    vim.cmd('highlight MyBorder guifg=#3e4451')
    return {
        { "╭", "MyBorder" },
        { "─", "MyBorder" },
        { "╮", "MyBorder" },
        { "│", "MyBorder" },
        { "╯", "MyBorder" },
        { "─", "MyBorder" },
        { "╰", "MyBorder" },
        { "│", "MyBorder" },
    }
end

-- Improved ToggleTerminal function with border
function ToggleTerminal()
    local term_bufnr = vim.fn.bufnr('term://')
    if term_bufnr == -1 then
        vim.cmd('botright 15new')
        local win = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_option(win, 'winhighlight', 'Normal:Normal,FloatBorder:MyBorder')
        vim.api.nvim_win_set_config(win, { border = create_border() })
        vim.cmd('terminal')
        term_bufnr = vim.api.nvim_get_current_buf()
        vim.cmd('startinsert')
    else
        local term_winnr = vim.fn.bufwinnr(term_bufnr)
        if term_winnr == -1 then
            vim.cmd('botright 15split')
            local win = vim.api.nvim_get_current_win()
            vim.api.nvim_win_set_option(win, 'winhighlight', 'Normal:Normal,FloatBorder:MyBorder')
            vim.api.nvim_win_set_config(win, { border = create_border() })
            vim.cmd('buffer ' .. term_bufnr)
            vim.cmd('startinsert')
        else
            vim.cmd(term_winnr .. 'close')
        end
    end
end

-- Key mapping to toggle terminal
vim.api.nvim_set_keymap('n', '<F4>', ':lua ToggleTerminal()<CR>', { noremap = true, silent = true })

-- Easy way to exit terminal mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Optional: Easy way to switch between terminal and other windows
vim.api.nvim_set_keymap('t', '<C-w>h', '<C-\\><C-n><C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-w>j', '<C-\\><C-n><C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-w>k', '<C-\\><C-n><C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-w>l', '<C-\\><C-n><C-w>l', { noremap = true, silent = true })

-- Terminal settings
vim.cmd('autocmd TermOpen * setlocal nonumber norelativenumber')
vim.cmd('autocmd TermOpen * startinsert')

require('refactoring').setup({
    prompt_func_return_type = {
        python = true
    },
    prompt_func_param_type = {
        python = true
    },
    printf_statements = {},
    print_var_statements = {},
    show_success_message = false, -- shows a message with information about the refactor on success
                                  -- i.e. [Refactor] Inlined 3 variable occurrences
})

require("conform").setup({
  formatters_by_ft = {
    python = { "black" },
    -- Add more formatters for other filetypes as needed
    -- lua = { "stylua" },
    -- javascript = { "prettier" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua require("conform").format()<CR>', { noremap = true, silent = true })

-- Basic settings
vim.o.number = true         -- Show line numbers
vim.o.relativenumber = true -- Show relative line numbers
vim.o.cursorline = true     -- Highlight the current line
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.encoding = 'utf-8'

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

-- Terminal settings
vim.cmd([[
  " Set a different background color for terminal
  autocmd TermOpen * setlocal winhighlight=Normal:TermNormal
  highlight TermNormal guibg=#2C323C

  " Add a border to terminal windows
  autocmd TermOpen * setlocal winhl=Normal:TermNormal,NormalNC:TermNormalNC
  highlight TermNormal guibg=#2C323C
  highlight TermNormalNC guibg=#2C323C

  " Increase contrast for terminal text
  highlight! TermCursor ctermfg=red guifg=red
]])

-- Function to toggle terminal with improved visibility
function _G.toggle_terminal()
    local term_bufnr = vim.fn.bufnr('term://*')
    if term_bufnr == -1 then
        vim.cmd('split | terminal')
        vim.cmd('resize 15')
        vim.wo.number = false
        vim.wo.relativenumber = false
        vim.cmd('startinsert')
    else
        local term_winnr = vim.fn.bufwinnr(term_bufnr)
        if term_winnr == -1 then
            vim.cmd('sbuffer ' .. term_bufnr)
            vim.cmd('resize 15')
            vim.wo.number = false
            vim.wo.relativenumber = false
            vim.cmd('startinsert')
        else
            vim.cmd(term_winnr .. 'close')
        end
    end
end


