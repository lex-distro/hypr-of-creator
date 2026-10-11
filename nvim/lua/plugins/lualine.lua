-- lua/plugins/lualine.lua
-- "mycolors" temanla eşleşen özel lualine teması.
--
-- Lualine mantığı: her mod (normal, insert, visual, replace, command, inactive)
-- için ayrı a/b/c renk katmanı var.
--   a = en soldaki/sağdaki "MODE" kutusu (en belirgin, dolgulu renk)
--   b = ortadaki blok (dosya adı, git branch vs.)
--   c = arka plan bloğu (diagnostics, dosya yolu vs.)
--
-- Renkler artık monochrome (gri tonlu) bir paletten geliyor.
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    -- Monochrome (grayscale) palette. Modes are told apart by lightness only.
    local palette = {
      bg = "#2B2B2B", -- Background
      bg_highlight = "#3A3A3A", -- section b background
      fg = "#E6E6E6", -- Foreground
      accent = "#F0F0F0", -- normal mode (lightest)
      string = "#C4C4C4", -- insert mode
      comment = "#7A7A7A", -- inactive text
      keyword = "#F0F0F0",
      line_numbers = "#3A3A3A",
      active_num = "#F0F0F0",
      -- Other mode shades
      nord_yellow = "#8C8C8C", -- visual mode
      nord_red = "#707070", -- replace mode
      nord_purple = "#A8A8A8", -- command mode
      nord_gray = "#232323", -- statusline background (one step darker than bg)
    }
    local mycolors_theme = {
      normal = {
        a = { bg = palette.accent, fg = palette.bg, gui = "bold" },
        b = { bg = palette.bg_highlight, fg = palette.fg },
        c = { bg = palette.nord_gray, fg = palette.fg },
      },
      insert = {
        a = { bg = palette.string, fg = palette.bg, gui = "bold" },
      },
      visual = {
        a = { bg = palette.nord_yellow, fg = palette.bg, gui = "bold" },
      },
      replace = {
        a = { bg = palette.nord_red, fg = palette.bg, gui = "bold" },
      },
      command = {
        a = { bg = palette.nord_purple, fg = palette.bg, gui = "bold" },
      },
      inactive = {
        a = { bg = palette.nord_gray, fg = palette.comment },
        b = { bg = palette.nord_gray, fg = palette.comment },
        c = { bg = palette.nord_gray, fg = palette.comment },
      },
    }
    opts.options = opts.options or {}
    opts.options.theme = mycolors_theme
    -- Powerline ok/üçgen yok ama bölümler birbirine karışmasın diye
    -- component'ler arasına düz "|" koyduk (dosya adı / fonksiyon adı vs.
    -- artık net ayrılıyor)
    opts.options.component_separators = { left = "|", right = "|" }
    opts.options.section_separators = { left = "", right = "" }
    opts.options.globalstatus = true
    return opts
  end,
}
