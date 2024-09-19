local o = vim.opt

o.breakindent = true -- Enable break indent (default: false)
o.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim. (default: '')
-- o.colorcolumn = "80"
o.completeopt = "menuone,noselect" -- Set completeopt to have a better completion experience (default: 'menu,preview')
o.confirm = true
-- o.completeopt = "menu,menuone,noselect,noinsert,preview"
o.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
o.cursorline = true -- Enable highlighting of the current line
o.expandtab = true -- use spaces instead of tabs
o.formatoptions = "tcqjlno" -- o option doenst work ???!
o.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = "⸱",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
o.ignorecase = true
o.iskeyword:append({ "-" }) -- hyphenated words recognized by search
-- o.laststatus = 3         -- global statusline (default 2)
o.list = true -- Show some invisible characters (tabs...
o.listchars:append({
	space = "⋅",
	eol = "↴",
})
o.linebreak = true
o.mouse = "a"
o.number = true
o.numberwidth = 4 -- adjust the room for the line number
o.pumheight = 10 -- Maximum number of entries in a popup (default: 0)
o.relativenumber = true
o.ruler = false
o.scrolloff = 99 -- Lines of context
o.shiftround = true -- Round indent
o.shiftwidth = 4 -- Size of an indent
o.showmode = false -- Dont show mode since we have a statusline
o.shortmess:append({
	W = true,
	I = true,
	c = true,
})
o.showtabline = 1 -- Always show tabs (default: 1)
o.sidescrolloff = 8 -- Columns of context
o.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
o.smartcase = true -- Don't ignore case with capitals
o.smartindent = true -- Insert indents automatically
-- o.spelllang = { "en,de" } -- Spellchecking
o.splitbelow = true -- Put new windows below current
o.splitright = true -- Put new windows right of current
o.swapfile = false -- Disable Swapfiles (default: true)
o.tabstop = 4 -- Number of spaces tabs count for
o.termguicolors = true -- True color support
o.timeoutlen = 300 -- Time in milliseconds to wait for a mapped sequence to complete.
o.undofile = true
o.updatetime = 250 -- Save swap file and trigger CursorHold (time in milliseconds)
o.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
o.whichwrap = "b,s,<,>,[,],h,l" -- Allow cursor to move within wraps
o.wildmode = "longest:full,full" -- Command-line completion mode
o.winminwidth = 5 -- Minimum window width
o.writebackup = false

if vim.fn.has("nvim-0.10") == 1 then
	o.smoothscroll = true
end

-- Fix markdown indentation settings
-- vim.g.markdown_recommended_style = 0

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
