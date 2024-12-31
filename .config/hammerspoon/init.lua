hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.alert.show("Hello World fooooooo1!")
end)


--------------------------------------
-- Commonly Used "Listen" Shortcuts --
--------------------------------------
-- Press cmd/ctrl + option/shift + 0 to create text.

-- local H1 = {{"cmd", "option"}, "1"} -- Asana,
-- local H1 = {{"cmd", "option", "shift", "ctrl"}, "1"} -- Asana,
-- local H1 = {{"cmd", "alt", "shift", "ctrl"}, "1"} -- Asana,
local H1 = {{"cmd", "option"}, "1"} -- Asana,
-- local H2 = {{"cmd", "option"}, "2"}
-- local H3 = {{"cmd", "option"}, "3"}
-- local CHECKBOX = {{"cmd", "option"}, "4"}
-- local BULLET_LIST = {{"cmd", "option"}, "5"}
-- local NUMBERED_LIST = {{"cmd", "option"}, "6"}
-- local TOGGLE_LIST = {{"cmd", "option"}, "7"}
-- local CODE_BLOCK = {{"cmd", "option"}, "8"}
-- local COMMENT = {{"cmd", "shift"}, "M"}
-- local STRIKETHROUGH = {{"cmd", "shift"}, "S"}

local INLINE_CODE_BLOCK = {{"cmd"}, "E"}       -- for example, a shortcut to trigger an inline code block
local COPY_URL = {{"cmd"}, "L"}

-- Sample config table. Each key is an application name, and the value is a list of shortcuts.
-- "listenShortcut" is the keystroke you want Hammerspoon to listen for;
-- "overwriteShortcut" is what Hammerspoon sends to the app.
-- Add more as needed…

local shortcutsConfig = {
  Slack = {
    {
      listenShortcut = INLINE_CODE_BLOCK,
      overwriteShortcut = {{"cmd", "shift"}, "C"}
    },
  },
  Linear = {
    {
      listenShortcut = COPY_URL,
      overwriteShortcut = {{"cmd", "shift"}, ","}
    },
    {
      listenShortcut = H1,
      overwriteShortcut = {{"ctrl", "shift"}, "1"}
    },
  },
  Asana = {
    {
      listenShortcut = INLINE_CODE_BLOCK,
      overwriteShortcut = {{"cmd", "shift"}, "M"}
    },
  },
}

-- For each app in the table, we create a window filter that “turns on” hotkeys
-- when the app is focused and “turns them off” when you switch away.
for appName, shortcuts in pairs(shortcutsConfig) do
  -- Create a window filter for just this one app
  local appFilter = hs.window.filter.new(false):setAppFilter(appName)
  local hotkeys = {}  -- We'll store the hotkey objects so we can remove them later

  -- When the app is focused, bind the relevant hotkeys
  appFilter:subscribe(hs.window.filter.windowFocused, function()
    for _, shortcutItem in ipairs(shortcuts) do
      local listenMods, listenKey = table.unpack(shortcutItem.listenShortcut)
      local sendMods, sendKey = table.unpack(shortcutItem.overwriteShortcut)

      -- Bind the hotkey
      local h = hs.hotkey.bind(listenMods, listenKey, function()
        -- hs.timer.usleep(50000)  -- 50ms delay
        hs.eventtap.keyStroke(sendMods, sendKey)
      end)
      table.insert(hotkeys, h)
    end
  end)

  -- When the app is unfocused, disable and delete all the hotkeys we just created
  appFilter:subscribe(hs.window.filter.windowUnfocused, function()
    for _, h in ipairs(hotkeys) do
      h:delete()
    end
    hotkeys = {}
  end)
end

