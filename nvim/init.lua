vim.cmd [[
    highlight Normal guibg=none
    highlight NonText guibg=none
    highlight Normal ctermbg=none
    highlight NonText ctermbg=none
    set number
]]


vim.cmd("colorscheme quiet")

vim.api.nvim_set_hl(0, "Visual", { bg = "gray", fg = "black" })
vim.api.nvim_set_hl(0, "Search", { bg = "#fbbf24", fg = "#000000" })





