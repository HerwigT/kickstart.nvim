vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap.set
local vscode = require 'vscode'
local opts = { noremap = true, silent = true }

-- remap leader key
keymap('n', '<Space>', '<Nop>', opts)

-- yank to system clipboard
keymap({ 'n', 'v' }, '<leader>y', '"+y', opts)

-- paste from system clipboard
keymap({ 'n', 'v' }, '<leader>p', '"+p', opts)

-- better indent handling
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- move text up and down
keymap('v', 'J', ':m .+1<CR>==', opts)
keymap('v', 'K', ':m .-2<CR>==', opts)
keymap('x', 'J', ":move '>+1<CR>gv-gv", opts)
keymap('x', 'K', ":move '<-2<CR>gv-gv", opts)

-- paste preserves primal yanked piece
keymap('v', 'p', '"_dP', opts)

-- removes highlighting after escaping vim search
keymap('n', '<Esc>', '<Esc>:noh<CR>', opts)

-- smart window navigation
keymap('n', '<leader>wh', function()
  vscode.call 'workbench.action.navigateLeft'
end, opts)
keymap('n', '<leader>wl', function()
  vscode.call 'workbench.action.navigateRight'
end, opts)
keymap('n', '<leader>wj', function()
  vscode.call 'workbench.action.navigateDown'
end, opts)
keymap('n', '<leader>wk', function()
  vscode.call 'workbench.action.navigateUp'
end, opts)

-- file related
-- file search
keymap('n', '<leader>ff', function()
  vscode.call 'workbench.action.quickOpen'
end)
-- global search
keymap('n', '<leader>fg', function()
  vscode.call 'workbench.action.findInFiles'
end)
-- format file
keymap('n', '<leader>fd', function()
  vscode.call 'editor.action.formatDocument'
end)

-- tab/editor navigation
keymap('n', '<leader>bn', function()
  vscode.call 'workbench.action.nextEditor'
end)
keymap('n', '<leader>bp', function()
  vscode.call 'workbench.action.previousEditor'
end)
keymap('n', '<leader>bd', function()
  vscode.call 'workbench.action.closeActiveEditor'
end)
-- code related
-- code action quick fix
keymap('n', '<leader>ca', function()
  vscode.call 'editor.action.quickFix'
end)
-- rename
keymap('n', '<leader>cr', function()
  vscode.call 'editor.action.rename'
end)
-- reveal definition
keymap('n', 'gd', function()
  vscode.call 'editor.action.revealDefinition'
end)
keymap('n', 'gp', function()
  vscode.call 'editor.action.peekDefinition'
end)
keymap('n', 'gr', function()
  vscode.call 'editor.action.referenceSearch.trigger'
end)
keymap('n', 'gi', function()
  vscode.call 'editor.action.goToImplementation'
end)
keymap('n', 'K', function()
  vscode.call 'editor.action.showHover'
end)
-- format file
keymap('n', '<leader>cf', function()
  vscode.call 'editor.action.formatDocument'
end)

-- error related
keymap('n', '<leader>en', function()
  vscode.call 'editor.action.marker.next'
end)
keymap('n', '<leader>ep', function()
  vscode.call 'editor.action.marker.prev'
end)
keymap('n', '<leader>e', function()
  vscode.call 'editor.action.showHover'
end)

-- terminal toggle
keymap('n', '<leader>tt', function()
  vscode.call 'workbench.action.terminal.toggleTerminal'
end, opts)
