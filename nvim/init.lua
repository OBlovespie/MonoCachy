
vim.cmd [[
    highlight Normal guibg=none
    highlight NonText guibg=none
    highlight Normal ctermbg=none
    highlight NonText ctermbg=none
]]




 vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local gray = "#cfcfcf"
    local darker = "#8a8a8a"

    local mono = {
      Normal      = { fg = gray, bg = "NONE" },
      Comment     = { fg = darker, bg = "NONE", italic = true },
      Constant    = { fg = gray, bg = "NONE" },
      String      = { fg = gray, bg = "NONE" },
      Identifier  = { fg = gray, bg = "NONE" },
      Statement   = { fg = gray, bg = "NONE" },
      PreProc     = { fg = gray, bg = "NONE" },
      Type        = { fg = gray, bg = "NONE" },
      Special     = { fg = gray, bg = "NONE" },
      Underlined  = { fg = gray, bg = "NONE", underline = true },

      Visual      = { fg = gray,  bg = "NONE" },
      CursorLine  = { fg = gray, bg = "NONE" },
      Search      = { fg = gray, bg = "NONE" },
      NormalFloat = { bg = "NONE" },
    }

    for group, opts in pairs(mono) do
      vim.api.nvim_set_hl(0, group, opts)
    end
  end,
})

vim.cmd([[doautocmd ColorScheme]])

