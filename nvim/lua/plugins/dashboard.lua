-- lua/plugins/dashboard.lua
-- Replaces the big "LazyVim" banner on the start screen.
-- Replace the text between [[ and ]] with whatever you want
-- (ASCII art, your name, a quote...). Keep it monospace.
return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
██╗     ███████╗██╗  ██╗██╗   ██╗██╗███╗   ███╗
██║     ██╔════╝╚██╗██╔╝██║   ██║██║████╗ ████║
██║     █████╗   ╚███╔╝ ██║   ██║██║██╔████╔██║
██║     ██╔══╝   ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║
███████╗███████╗██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      },
    },
  },
}
