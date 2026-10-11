-- Clear existing highlights and set the theme name
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "gruvbox"

-- Gruvbox Dark palette
local palette = {
  bg = "#282828",
  bg_highlight = "#3c3836", -- Aktif satır için hafif açık arka plan
  fg = "#ebdbb2",
  accent = "#504945",
  string = "#b8bb26", -- Gruvbox yeşili
  comment = "#928374", -- Gruvbox gri
  keyword = "#fb4934", -- Gruvbox kırmızısı
  line_numbers = "#7c6f64", -- Pasif satır numaraları
  active_num = "#fabd2f", -- Aktif satır numarası (Gruvbox sarısı)
}

-- Apply colors to Neovim UI highlight groups
local highlights = {
  -- Editor Base UI
  Normal = { fg = palette.fg, bg = palette.bg },
  CursorLine = { bg = palette.bg_highlight },
  LineNr = { fg = palette.line_numbers },
  CursorLineNr = { fg = palette.active_num, bold = true },

  -- Basic Code Syntax
  Comment = { fg = palette.comment, italic = true },
  Keyword = { fg = palette.keyword, bold = true },
  String = { fg = palette.string },
  Function = { fg = "#b8bb26", bold = true }, -- Gruvbox'ta fonksiyonlar yeşil

  -- Popup Menu (Açılır Menü ve Otomatik Tamamlama)
  Pmenu = { fg = palette.fg, bg = palette.bg_highlight },
  PmenuSel = { fg = palette.bg, bg = palette.fg }, -- Aktif seçenek: açık zemin, koyu yazı
  PmenuKind = { fg = palette.comment, bg = palette.bg_highlight },
  PmenuKindSel = { fg = palette.bg, bg = palette.string },
}

-- Execute highlight application loop
for group, settings in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, settings)
end
