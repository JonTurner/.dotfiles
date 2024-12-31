hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.alert.show("Hello World fooooooo1!")
end)


--------------------------------------
-- Commonly Used "Listen" Shortcuts --
--------------------------------------
-- Press cmd/ctrl + option/shift + 0 to create text.

-- local H1 = {{"cmd", "alt"}, "1"} -- Asana,
-- local H2 = {{"cmd", "alt"}, "2"}
-- local H3 = {{"cmd", "alt"}, "3"}
-- local CHECKBOX = {{"cmd", "alt"}, "4"}
-- local BULLET_LIST = {{"cmd", "alt"}, "5"}
-- local NUMBERED_LIST = {{"cmd", "alt"}, "6"}
-- local TOGGLE_LIST = {{"cmd", "alt"}, "7"}
-- local CODE_BLOCK = {{"cmd", "alt"}, "8"}
-- local COMMENT = {{"cmd", "shift"}, "M"}
-- local STRIKETHROUGH = {{"cmd", "shift"}, "S"}

local INLINE_CODE_BLOCK = {{"cmd"}, "E"}       -- for example, a shortcut to trigger an inline code block
local COPY_URL = {{"cmd"}, "L"}
-- made up shortcuts to hopefully avoid collisions
-- local H1 = {{"cmd", "alt", "shift", "ctrl"}, "4"} -- Asana,
-- local H2 = {{"cmd", "alt", "shift", "ctrl"}, "5"} -- Asana,
-- local H3 = {{"cmd", "alt", "shift", "ctrl"}, "6"} -- Asana,
-- local CHECKBOX = {{"cmd", "alt", "shift", "ctrl"}, "8"}
-- made up shortcuts to hopefully avoid collisions
local H1 = {{"cmd", "ctrl"}, "4"} -- Asana,
local H2 = {{"cmd", "ctrl"}, "5"} -- Asana,
local H3 = {{"cmd", "ctrl"}, "6"} -- Asana,
local CHECKBOX = {{"cmd", "alt", "shift", "ctrl"}, "8"}


-- Sample config table. Each key is an application name, and the value is a list of shortcuts.
-- "listenShortcut" is the keystroke you want Hammerspoon to listen for;
-- "overwriteShortcut" is what Hammerspoon sends to the app.
-- Add more as needed…

local shortcutsConfig = {
  Notion ={
    {
      listenShortcut = H1,
      overwriteShortcut = {{"cmd", "alt"}, "1"}
    },
    {
      listenShortcut = H2,
      overwriteShortcut = {{"cmd", "alt"}, "2"}
    },
    {
      listenShortcut = H3,
      overwriteShortcut = {{"cmd", "alt"}, "3"}
    },
  },
  Slack = { -- does not support H1,H2,H3
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
    {
      listenShortcut = H2,
      overwriteShortcut = {{"ctrl", "shift"}, "2"}
    },
    {
      listenShortcut = H3,
      overwriteShortcut = {{"ctrl", "shift"}, "3"}
    },
    {
      listenShortcut = H3,
      overwriteShortcut = {{"ctrl", "shift"}, "3"}
    },
    {
      listenShortcut = CHECKBOX,
      overwriteShortcut = {{"cmd", "shift"}, "7"}
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

