local state_dir = vim.fn.expand("~/.config/nvim")
local watcher -- GC olmasın diye dışarıda tutuluyor

-- Önce switcher'ın yazdığı dosya, yoksa $LEX_THEME
local function theme_name()
  local f = io.open(state_dir .. "/theme", "r")
  if f then
    local v = f:read("*l")
    f:close()
    if v and vim.trim(v) ~= "" then
      return vim.trim(v)
    end
  end
  return vim.env.LEX_THEME
end

local function apply()
  local name = theme_name()
  if not name or name == "" then
    return
  end
  local ok, err = pcall(vim.cmd.colorscheme, name)
  if not ok then
    vim.notify("LEX_THEME: '" .. name .. "' yüklenemedi\n" .. tostring(err), vim.log.levels.WARN)
  end
end

local function watch()
  if watcher then
    return
  end
  watcher = vim.uv.new_fs_event()
  -- Klasörü izliyoruz; dosya `mv` ile değiştirilse bile kaçırmaz
  watcher:start(
    state_dir,
    {},
    vim.schedule_wrap(function(err, fname)
      if not err and fname == "theme" then
        apply()
      end
    end)
  )
end

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        apply()
        vim.fn.mkdir(state_dir, "p")
        watch()
      end,
    },
  },
}
