hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.alert.show("Hello World fooooooo112233221323445o!")
end)

-- -- We'll use a window filter to detect when Slack gains or loses focus
-- local slackFilter = hs.window.filter.new(false):setAppFilter("Slack")
--
-- -- We'll keep a reference to our hotkey so we can enable/disable it
-- local slackHotkey
--
-- -- Enable the hotkey when Slack is focused
-- slackFilter:subscribe(hs.window.filter.windowFocused, function()
--   slackHotkey = hs.hotkey.bind({"cmd"}, "E", function()
--     -- When the user presses Ctrl+Shift+A, Hammerspoon will fire Cmd+Shift+K in Slack
--     hs.eventtap.keyStroke({"cmd", "shift"}, "C")
--   end)
-- end)
--
-- -- Disable the hotkey when Slack is unfocused
-- slackFilter:subscribe(hs.window.filter.windowUnfocused, function()
--   if slackHotkey then
--     slackHotkey:disable()
--     slackHotkey:delete()
--     slackHotkey = nil
--   end
-- end)



-- Sample config table. Each key is an application name, and the value is a list of shortcuts.
-- "listenShortcut" is the keystroke you want Hammerspoon to listen for;
-- "overwriteShortcut" is what Hammerspoon sends to the app.
local shortcutsConfig = {
  Slack = {
    {
      name = "inline code block",
      listenShortcut = {{"cmd"}, "E"},          -- e.g. Cmd+E
      overwriteShortcut = {{"cmd", "shift"}, "C"} -- e.g. Cmd+Shift+C
    },
    -- Add more Slack shortcuts here...
  },
  Safari = {
    {
      name = "some Safari shortcut",
      listenShortcut = {{"ctrl", "shift"}, "S"},
      overwriteShortcut = {{"cmd"}, "R"}
    }
    -- Add more Safari shortcuts here...
  },
  -- Add other apps with their shortcuts here...
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

