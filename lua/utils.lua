-- Keymap functions
-- Adapted from: https://github.com/miltonllera/neovim-config/blob/master/lua/utils.lua

local M = {}

function M.map(mode, lhs, rhs, desc, opts)
        opts = not opts and {} or opts
        vim.keymap.set(mode, lhs, rhs, {silent =  true, desc = desc, remap = true, unpack(opts)})
end

function M.noremap(mode, lhs, rhs, desc, opts)
        opts = not opts and {} or opts
        vim.keymap.set(mode, lhs, rhs, {silent = true, desc = desc, unpack(opts)})
end

function M.exprnoremap(mode, lhs, rhs, desc, opts)
        opts = not opts and {} or opts
        vim.keymap.set(mode, lhs, rhs, {silent = true, expr = true, desc = desc, unpack(opts)})
end

-- Useful mode-specific shortcuts
-- nomenclature: "<expr?><mode><nore?>map(lhs, rhs)" where:
--      "expr?" optional expr option
--      "nore?" optional no-remap option
--      modes -> 'n' = NORMAL, 'i' = INSERT, 'x' = 'VISUAL', 'v' = VISUAL + SELECT, 't' = TERMINAL

function M.nmap(lhs, rhs, desc) M.map('n', lhs, rhs, desc, opts) end

function M.imap(lhs, rhs, desc) M.map('i', lhs, rhs, desc, opts) end

function M.xmap(lhs, rhs, desc) M.map('x', lhs, rhs, desc, opts) end

function M.nnoremap(lhs, rhs, desc) M.noremap('n', lhs, rhs, desc, opts) end

function M.vnoremap(lhs, rhs, desc) M.noremap('v', lhs, rhs, desc, opts) end

function M.xnoremap(lhs, rhs, desc) M.noremap('x', lhs, rhs, desc, opts) end

function M.inoremap(lhs, rhs, desc) M.noremap('i', lhs, rhs, desc, opts) end

function M.tnoremap(lhs, rhs, desc) M.noremap('t', lhs, rhs, desc, opts) end

function M.exprnnoremap(lhs, rhs, desc) M.exprnoremap('n', lhs, rhs, desc, opts) end

function M.exprinoremap(lhs, rhs, desc) M.exprnoremap('i', lhs, rhs, desc, opts) end

return M
