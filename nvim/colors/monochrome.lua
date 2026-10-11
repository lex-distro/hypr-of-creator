-- Clear existing highlights and set the theme name
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "monochrome"

-- Define your custom hex palette
local palette = {
  bg = "#000000", -- Senin seçtiğin koyu arka plan
  bg_highlight = "#141414", -- Aktif satır için hafifçe açılmış arka plan
  fg = "#eceff4",
  accent = "#1d2b21", -- Vurgu rengi (isteğe bağlı değiştirilebilir)
  string = "#a6e3a1",
  comment = "#585b70",
  keyword = "#EA6962",
  line_numbers = "#45475a", -- Pasif satır numaraları için soluk gri
  active_num = "#FFFFFF", -- Aktif satır numarası için yumuşak bir sarı/gold
}

-- Apply colors to Neovim UI highlight groups
local highlights = {
  -- Editor Base UI
  Normal = { fg = palette.fg, bg = palette.bg },
  CursorLine = { bg = palette.bg_highlight }, -- Satırı tamamen boyamak yerine hafifçe açar
  LineNr = { fg = palette.line_numbers },
  CursorLineNr = { fg = palette.active_num, bold = true }, -- Aktif satır numarası belirgin ama temiz

  -- Basic Code Syntax
  Comment = { fg = palette.comment, italic = true },
  Keyword = { fg = palette.keyword, bold = true },
  String = { fg = palette.string },
  Function = { fg = palette.fg }, -- Fonksiyonları ana yazı renginde tutup Tree-sitter ile renklendirebiliriz
  -- Popup Menu (Açılır Menü ve Otomatik Tamamlama)
  Pmenu = { fg = palette.fg, bg = "#000000" }, -- Menünün genel arka planı (biraz açık gri)
  PmenuSel = { fg = palette.bg, bg = "#eceff4" }, -- AKTİF SEÇENEK: Arka planı yeşil, yazıyı koyu yapar
  PmenuKind = { fg = palette.comment, bg = "#1e2122" }, -- Soldaki ikonların rengi
  PmenuKindSel = { fg = palette.bg, bg = palette.string }, -- Seçili ikonun rengi
}

-- Execute highlight application loop
for group, settings in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, settings)
end
