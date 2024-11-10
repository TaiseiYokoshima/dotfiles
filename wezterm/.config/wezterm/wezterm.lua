local wezterm = require("wezterm")

-- config builder
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMonoNerdFont")
config.font_size = 15.0
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 0,
  right = 0,
  bottom = 0,
  top = 0,
}

config.window_background_image = '/home/rom/wallpapers/ghost_in_the_shell.jpg'
-- config.window_background_image = '/home/rom/wallpapers/akira.jpg'
config.window_background_image_hsb = {
  brightness = 0.05,
  hue = 1.0,
  saturation = 1.0,
}

config.default_prog = {'/usr/bin/fish'}


config.disable_default_key_bindings = true


local act = wezterm.action

config.keys = {
  {
    key = "=",
    mods = "SUPER",
    action = "IncreaseFontSize"
  },
  {
    key = "0",
    mods = "SUPER",
    action = "ResetFontSize"
  },
  {
    key = ':',
    mods = 'SHIFT|SUPER',
    action = "ActivateCommandPalette"
  },
  {
    key = "j",
    mods = "SUPER",
    action = act.CopyTo 'Clipboard'
  },
  {
    key = "k",
    mods = "SUPER",
    action = act.PasteFrom "Clipboard"
  },
  {
    key = 'l',
    mods = 'SUPER',
    action = 'ActivateCopyMode'
  },
  {
    key = "-",
    mods = "SUPER",
    action = "DecreaseFontSize"
  },
  {
    key = "n",
    mods = "SUPER",
    action = 'SpawnWindow'
  },
  -- {
  --   key = "LeftArrow",
  --   mods = "SUPER",
  --   action = act.Multiple {
  --     "ActivateCopyMode",
  --     act.CopyMode { SetSelectionMode = 'Cell' },
  --     act.CopyMode "MoveLeft",
  --     "PopKeyTable"
  --   }
  -- },
}



-- local act = wezterm.action
local copy_mode = {
  {
    key = 'v',
    mods = None,
    action = act.CopyMode { SetSelectionMode = 'Cell' }
  },
  {
    key = 'v',
    mods = "SHIFT",
    action = act.CopyMode { SetSelectionMode = 'Line' }
  },
  {
    key = 'v',
    mods = "CTRL",
    action = act.CopyMode { SetSelectionMode = 'Block' }
  },



  {
    key = 'w',
    mods = None,
    action = act.CopyMode 'MoveForwardWord'
  },
  {
    key = 'e',
    mods = None,
    action = act.CopyMode 'MoveForwardWordEnd'
  },
  {
    key = 'b',
    mods = None,
    action = act.CopyMode 'MoveBackwardWord'
  },



  {
    key = "j",
    mods = None,
    action = act.CopyMode "MoveUp"
  },
  {
    key = "k",
    mods = None,
    action = act.CopyMode "MoveLeft"
  },
  {
    key = "l",
    mods = None,
    action = act.CopyMode "MoveRight"
  },
  {
    key = ";",
    mods = None,
    action = act.CopyMode "MoveDown"
  },


  {
    key = "Comma",
    mods = "SHIFT",
    action = act.Multiple{ act.CopyMode "MoveUp", act.CopyMode "MoveUp", act.CopyMode "MoveUp", act.CopyMode "MoveUp", act.CopyMode "MoveUp"  }
  },
  {
    key = "Period",
    mods = "SHIFT",
    action = act.Multiple{ act.CopyMode "MoveDown", act.CopyMode "MoveDown", act.CopyMode "MoveDown", act.CopyMode "MoveDown", act.CopyMode "MoveDown"  }
  },
  {
    key = "J",
    mods = "SHIFT",
    action = act.Multiple { act.CopyMode "MoveUp", act.CopyMode "MoveUp" }
  },
  {
    key = ":",
    mods = "SHIFT",
    action = act.Multiple { act.CopyMode "MoveDown", act.CopyMode "MoveDown" }
  },

  {
    key = '_',
    mods = "SHIFT",
    action = act.CopyMode 'MoveToStartOfLineContent'
  },
  {
    key = 'Home',
    mods = None,
    action = act.CopyMode 'MoveToStartOfLine'
  },
  {
    key = 'End',
    mods = None,
    action = act.CopyMode 'MoveToEndOfLineContent'
  },


  {
    key = 'c',
    mods = None,
    action = act.CopyMode 'ClearSelectionMode'
  },
  -- {
  --   key = 'Escape',
  --   mods = None,
  --   action = act.CopyMode 'Close'
  -- },
  {
    key = 'Escape',
    mods = None,
    action = act.Multiple { act.ClearSelection, act.CopyMode 'Close' }
  },
  {
    key = 'y',
    mods = None,
    action = act.Multiple {
      act.CopyTo 'Clipboard',
      act.ClearSelection,
      act.CopyMode 'Close'
    }
  }
}



config.key_tables = {
  copy_mode = copy_mode,
  search_mode = {},
}







return config
