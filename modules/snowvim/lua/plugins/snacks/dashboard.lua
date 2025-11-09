return {
  enabled = true,
  preset = {
    keys = {
      {
        icon = " ",
        key = "f",
        desc = "Find File",
        action = ":lua Snacks.picker.files()",
      },
      {
        icon = " ",
        key = "n",
        desc = "New File",
        action = ":ene | startinsert",
      },
      {
        icon = " ",
        key = "w",
        desc = "Find Text",
        action = ":lua Snacks.picker.grep()",
      },
      { icon = " ", key = "q", desc = "Quit", action = ":qa" },
    },
    header = [[
   ▄████████ ███▄▄▄▄    ▄██████▄   ▄█     █▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄  
  ███    ███ ███▀▀▀██▄ ███    ███ ███     ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄
  ███    █▀  ███   ███ ███    ███ ███     ███ ███    ███ ███▌ ███   ███   ███
  ███        ███   ███ ███    ███ ███     ███ ███    ███ ███▌ ███   ███   ███
▀███████████ ███   ███ ███    ███ ███     ███ ███    ███ ███▌ ███   ███   ███
         ███ ███   ███ ███    ███ ███     ███ ███    ███ ███  ███   ███   ███
   ▄█    ███ ███   ███ ███    ███ ███ ▄█▄ ███ ███    ███ ███  ███   ███   ███
 ▄████████▀   ▀█   █▀   ▀██████▀   ▀███▀███▀   ▀██████▀  █▀    ▀█   ███   █▀ 
          ]],
  },
  formats = {
    key = function(item)
      return {
        { "[", hl = "special" },
        { item.key, hl = "key" },
        { "]", hl = "special" },
      }
    end,
  },
  sections = {
    {
      section = "header",
      indent = -5,
    },
    {
      -- icon = ' ',
      -- title = 'Builtin Actions',
      section = "keys",
      gap = 1,
      padding = 1,
    },
    {
      text = "󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘 ❄ ❄ ❄ 󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘󰇘",
      padding = 1,
    },
    {
      -- icon = ' ',
      title = "Recent Files",
      section = "recent_files",
      padding = 1,
    },
    {
      -- icon = ' ',
      title = "Projects",
      section = "projects",
      padding = 1,
    },
  },
}
