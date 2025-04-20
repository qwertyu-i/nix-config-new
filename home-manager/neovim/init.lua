local builtin = require('telescope.builtin')
local renderMarkdown = require('render-markdown')

vim.g.mapleader = " "

vim.cmd("set nu rnu")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")

vim.g.netrw_liststyle = 3

vim.opt.scrolloff = 6

vim.diagnostic.config {
	float={border="rounded"}
}

vim.keymap.set( 'n', '<leader>md', renderMarkdown.toggle )
vim.keymap.set( 'n', '<leader>err', vim.diagnostic.open_float )
vim.keymap.set( 'n', '<leader>sd', vim.lsp.buf.hover )

vim.diagnostic.config({ virtual_text = true })

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
