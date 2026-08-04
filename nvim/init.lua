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
vim.api.nvim_set_hl(0, "MatchParen", { fg = "white", bg = "gray", bold = true })

local P = {
    white  = "#FFFFFF",
    grey   = "#585858",
    lgrey  = "#d0d3d8",
    dgrey  = "#575959",
    egrey  = "#868e91",
}

local function set_hl(group, fg, opts)
opts = opts or {}
local spec = {
    fg = fg,
}

if opts.bold then spec.bold = true end
    if opts.italic then spec.italic = true end
        if opts.underline then spec.underline = true end
            if opts.undercurl then spec.undercurl = true end
                if opts.reverse then spec.reverse = true end
                    vim.api.nvim_set_hl(0, group, spec)
                    end


                    set_hl("Normal", P.white)
                    set_hl("NonText", P.white)
                    set_hl("EndOfBuffer", P.white)


                    set_hl("Comment", P.lgrey, { italic = true })
                    set_hl("String", P.egrey)
                    set_hl("Character", P.egrey)
                    set_hl("Number", P.lgrey)
                    set_hl("Boolean", P.lgrey)

                    set_hl("Identifier", P.lgrey)
                    set_hl("Function", P.grey)

                    set_hl("Statement", P.grey)
                    set_hl("Conditional", P.grey)
                    set_hl("Repeat", P.grey)

                    set_hl("Keyword", P.grey)
                    set_hl("Operator", P.egrey)
                    set_hl("PreProc", P.dgrey)
                    set_hl("Include", P.dgrey)

                    set_hl("Type", P.egrey)
                    set_hl("StorageClass", P.dgrey)
                    set_hl("Structure", P.lgrey)


                    set_hl("LineNr", P.dgrey)
                    set_hl("CursorLineNr", P.lgrey)


                    set_hl("DiagnosticError", P.lgrey, { bold = true })
                    set_hl("DiagnosticWarn", P.egrey, { bold = true })
                    set_hl("DiagnosticInfo", P.grey)
                    set_hl("DiagnosticHint", P.dgrey)


                    set_hl("Search", "#000000", { bold = true })


                    vim.api.nvim_create_autocmd("ColorScheme", {
                        callback = function()

                        vim.cmd("colorscheme quiet")


                        vim.cmd [[
                            highlight Normal guibg=none
                            highlight NonText guibg=none
                            highlight Normal ctermbg=none
                            highlight NonText ctermbg=none
                        ]]


                        vim.api.nvim_set_hl(0, "Visual", { bg = "none", fg = "white" })
                        vim.api.nvim_set_hl(0, "Search", { bg = "#fbbf24", fg = "#000000" })


                        set_hl("Normal", P.white)
                        set_hl("NonText", P.white)
                        set_hl("EndOfBuffer", P.white)

                        set_hl("Comment", P.lgrey, { italic = true })
                        set_hl("String", P.egrey)
                        set_hl("Character", P.egrey)
                        set_hl("Number", P.lgrey)
                        set_hl("Boolean", P.lgrey)

                        set_hl("Identifier", P.lgrey)
                        set_hl("Function", P.grey)

                        set_hl("Statement", P.grey)
                        set_hl("Conditional", P.grey)
                        set_hl("Repeat", P.grey)

                        set_hl("Keyword", P.grey)
                        set_hl("Operator", P.egrey)
                        set_hl("PreProc", P.dgrey)
                        set_hl("Include", P.dgrey)

                        set_hl("Type", P.egrey)
                        set_hl("StorageClass", P.dgrey)
                        set_hl("Structure", P.dgrey)

                        set_hl("LineNr", P.grey)
                        set_hl("CursorLineNr", P.lgrey)

                        set_hl("DiagnosticError", P.lgrey, { bold = true })
                        set_hl("DiagnosticWarn", P.egrey, { bold = true })
                        set_hl("DiagnosticInfo", P.grey)
                        set_hl("DiagnosticHint", P.dgrey)
                        end,
                    })
















