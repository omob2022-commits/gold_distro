-- GoldOS Neovim Configuration
-- Premium, Gold-Themed, Fast

-- ── Options ─────────────────────────────────────────────────────────
vim.opt.number = true           -- Show line numbers
vim.opt.relativenumber = true   -- Relative line numbers
vim.opt.cursorline = true       -- Highlight current line
vim.opt.termguicolors = true    -- True color support
vim.opt.scrolloff = 8           -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8       -- Keep 8 columns left/right
vim.opt.tabstop = 4             -- Tab width
vim.opt.shiftwidth = 4          -- Indent width
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.smartindent = true      -- Smart auto-indenting
vim.opt.wrap = false            -- No line wrapping
vim.opt.ignorecase = true       -- Ignore case in search...
vim.opt.smartcase = true        -- ...unless uppercase used
vim.opt.signcolumn = "yes"      -- Always show sign column
vim.opt.updatetime = 50         -- Faster completion
vim.opt.splitright = true       -- Vertical splits usage right
vim.opt.splitbelow = true       -- Horizontal splits use bottom

-- Clipboard
vim.opt.clipboard = "unnamedplus" -- Use system clipboard (needs wl-clipboard)

-- ── Keymaps ─────────────────────────────────────────────────────────
vim.g.mapleader = " "
local keymap = vim.keymap.set

-- Normal mode
keymap("n", "<leader>w", ":w<CR>", { desc = "Save" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap("n", "<leader>e", ":Ex<CR>", { desc = "Explorer" })
keymap("n", "<C-h>", "<C-w>h", { desc = "Window Left" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Window Down" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Window Up" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Window Right" })
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear highlights" })

-- Visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- ── Colorscheme ─────────────────────────────────────────────────────
-- Custom Dark Gold Theme
vim.cmd([[
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
    set background=dark
    let g:colors_name = "goldos"

    " Palette
    let s:bg = "#1a1a2e"
    let s:fg = "#e0d8c0"
    let s:acc = "#d4a04a"
    let s:acc2 = "#f0c674"
    let s:err = "#e06c5a"
    let s:str = "#7ec699"
    let s:comment = "#5c5c70"
    let s:sel = "#3d3d5c"

    exe "hi Normal guifg=" . s:fg . " guibg=NONE"
    exe "hi LineNr guifg=" . s:comment
    exe "hi CursorLineNr guifg=" . s:acc . " gui=bold"
    exe "hi CursorLine guibg=" . s:sel
    exe "hi Visual guibg=" . s:sel
    exe "hi Search guifg=" . s:bg . " guibg=" . s:acc2
    exe "hi Pmenu guibg=" . s:bg . " guifg=" . s:fg
    exe "hi PmenuSel guibg=" . s:acc . " guifg=" . s:bg

    " Syntax
    exe "hi Comment guifg=" . s:comment . " gui=italic"
    exe "hi String guifg=" . s:str
    exe "hi Number guifg=" . s:acc2
    exe "hi Function guifg=" . s:acc
    exe "hi Keyword guifg=" . s:acc2 . " gui=bold"
    exe "hi Statement guifg=" . s:acc2
    exe "hi Type guifg=" . s:acc
    exe "hi Identifier guifg=" . s:fg
    exe "hi Constant guifg=" . s:acc2
]])

-- ── Statusline ──────────────────────────────────────────────────────
vim.opt.laststatus = 3 -- Global statusline
vim.opt.statusline = "%#StatusLine# %f %m %= %y  %l:%c  %p%% "
