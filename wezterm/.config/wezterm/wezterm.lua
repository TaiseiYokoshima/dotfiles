local wezterm = require("wezterm")

-- config builder
local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({
  "JetBrainsMonoNerdFont",
  "Font Awesome 6 Free Solid"

})



config.font_size = 15.0
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.animation_fps = 70
config.max_fps = 70

config.enable_wayland = false
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 0,
  right = 0,
  bottom = 0,
  top = 0,
}






local utils = require("utils")





config.window_background_image = utils.background()


config.window_background_image_hsb = {
  brightness = utils.brightness(),
  -- brightness = 0.03,
  -- brightness = 0.1,
  -- hue = 1.0,
  saturation = 1.0,
}

config.default_prog = {'/usr/bin/fish'}


config.disable_default_key_bindings = true


local act = wezterm.action

config.keys = {
   -- {
   --    key = "=",
   --    mods = "ALT|SHIFT",
   --    action = function()
   --
   --    end
   --
   -- },

   -- {
   --    key = "Backspace",
   --    mods = "CTRL",
   --    action = act.SendKey { key = "w", mods = "CTRL" }
   --
   -- },

  {
    key = "=",
    mods = "ALT",
    action = "IncreaseFontSize"
  },
  {
    key = "0",
    mods = "ALT",
    action = "ResetFontSize"
  },
  {
    key = ':',
    mods = 'SHIFT|ALT',
    action = "ActivateCommandPalette"
  },
  {
    key = "j",
    mods = "ALT",
    action = act.CopyTo 'Clipboard'
  },
  {
    key = "k",
    mods = "ALT",
    action = act.PasteFrom "Clipboard"
  },
  {
    key = 'l',
    mods = 'ALT',
    action = 'ActivateCopyMode'
  },
  {
    key = "-",
    mods = "ALT",
    action = "DecreaseFontSize"
  },
  {
    key = "n",
    mods = "ALT",
    action = 'SpawnWindow'
  },
  -- {
  --   key = "LeftArrow",
  --   mods = "ALT",
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

