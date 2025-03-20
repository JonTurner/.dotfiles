-- web-based (Linear, Slack, Notion, etc.) or Electron-based apps
-- 1. Timing / Focus Issues in Web Apps (like Linear)
--   For some apps, a short delay b/f keystroke will fix
--   For others, two strokes with a pause in between might be necessary.
--   ie: hs.timer.usleep(50000)  -- 50ms delay
-- 2. Verifying “Focus” in the Editor
--   If your caret is not in a text field, the strikethrough command may do
--   nothing the first time. Then by the second time, Linear might place the
--   caret in the correct location.
--   fix: set focus then fire keystroke ** bad example provided using cordinates + mouse click
-- 3. Global Hotkey
--   ** this might be the answer to fix sometimes hotkeys don't work unless I reset focus on app
--   set up global hotkeys
--------------------------------------

local HYPER_KEY = {"cmd", "alt", "shift", "ctrl"}
local HYPER_KEY_NO_SHIFT = {"cmd", "alt", "ctrl"}
-- hs.hotkey.bind(HYPER_KEY, "W", function()
--   hs.alert.show("Hello World fooooooo1!")
-- end)


-- Linear: cmd + shift + . copies the branch name to your clipboard

-- made up shortcuts to hopefully avoid collisions
local INLINE_CODE_BLOCK = {HYPER_KEY_NO_SHIFT, "6"} -- except: Reflect
local COPY_URL = {HYPER_KEY_NO_SHIFT, "1"} -- only: Notion, Linear    except: Reflect, Slack, Asana
local H1 = {HYPER_KEY, "1"} -- except: Slack
local H2 = {HYPER_KEY, "2"} -- except: Slack
local H3 = {HYPER_KEY, "3"} -- except: Slack,Asana
local CHECKBOX = {HYPER_KEY, "4"}  -- except: Slack,Asana
local STRIKETHROUGH = {HYPER_KEY_NO_SHIFT, "S"} -- :all_applications!!!  (left out shift - so it doesn't conflict with Launch Slack shortcut)
local BULLET_LIST ={HYPER_KEY_NO_SHIFT, "8"} -- :all_applications!!!
local CODE_BLOCK = {HYPER_KEY, "8"} -- except: reflect
local NUMBERED_LIST = {HYPER_KEY, "6"} -- :all_applications!!!
local HIGHLIGHT = {HYPER_KEY, "5"} -- natively supported on Notion & Reflect (not supported: Slack, Asana, Linear)

-- Native Shortcuts that we are going to override
local NOTION_COPY_URL = {{"cmd"}, "L"}
local NOTION_H1 = {{"cmd", "alt"}, "1", 2}
local NOTION_H2 = {{"cmd", "alt"}, "2", 2}
local NOTION_H3 = {{"cmd", "alt"}, "3", 2}
local NOTION_INLINE_CODE_BLOCK = {{"cmd"}, "E"}
local NOTION_CHECKBOX = {{"cmd", "alt"}, "4", 2}
local NOTION_STRIKETHROUGH = {{"cmd", "shift"}, "S", 2}
local NOTION_BULLET_LIST = {{"cmd", "alt"}, "5", 2}
local NOTION_CODE_BLOCK = {{"cmd", "alt"}, "8", 2}
local NOTION_NUMBERED_LIST = {{"cmd", "alt"}, "6", 2}
local NOTION_HIGHLIGHT = {{"cmd", "shift"}, "H"}

local SLACK_INLINE_CODE_BLOCK = {{"cmd", "shift"}, "C"}
local SLACK_STRIKETHROUGH = {{"cmd", "shift"}, "X"}
local SLACK_BULLET_LIST ={{"cmd", "shift"}, "8", 2}
local SLACK_CODE_BLOCK = {{"cmd", "alt", "shift"}, "C"}
local SLACK_NUMBERED_LIST = {{"cmd", "shift"}, "7"}

local LINEAR_COPY_URL = {{"cmd", "shift"}, ","}
local LINEAR_H1 = {{"ctrl", "shift"}, "1", 2}
local LINEAR_H2 = {{"ctrl", "shift"}, "2", 2}
local LINEAR_H3 = {{"ctrl", "shift"}, "3", 2}
local LINEAR_INLINE_CODE_BLOCK = {{"cmd"}, "E"}
local LINEAR_CHECKBOX = {{"cmd", "shift"}, "7"}
local LINEAR_STRIKETHROUGH = {{"cmd"}, "S", 2}
local LINEAR_BULLET_LIST ={{"cmd", "shift"}, "8", 2}
local LINEAR_CODE_BLOCK = {{"cmd", "shift"}, "\\"}
local LINEAR_NUMBERED_LIST = {{"cmd", "shift"}, "9"}

local ASANA_INLINE_CODE_BLOCK = {{"cmd", "shift"}, "M"}
local ASANA_H1 = {{"cmd", "alt"}, "1", 2}
local ASANA_H2 = {{"cmd", "alt"}, "2", 2}
local ASANA_STRIKETHROUGH = {{"cmd", "shift"}, "X"}
local ASANA_BULLET_LIST ={{"cmd", "shift"}, "8", 2}
local ASANA_CODE_BLOCK = {{"cmd", "shift"}, "C"}
local ASANA_NUMBERED_LIST = {{"cmd", "shift"}, "7"}

local REFLECT_H1 = {{"cmd", "alt"}, "1", 2}
local REFLECT_H2 = {{"cmd", "alt"}, "2", 2}
local REFLECT_H3 = {{"cmd", "alt"}, "3", 2}
local REFLECT_CHECKBOX = {{"cmd"}, "return"}
local REFLECT_STRIKETHROUGH = {{"cmd", "shift"}, "X"}
local REFLECT_BULLET_LIST ={{"cmd", "shift"}, "8"}
local REFLECT_NUMBERED_LIST = {{"cmd", "shift"}, "7"}
local REFLECT_HIGHLIGHT = {{"cmd", "shift"}, "H"}

local CHROME_COPY_URL = {{"cmd"}, "L", 2}

local FIREFOX_COPY_URL = {{"cmd"}, "L"}

local shortcutsConfig = {
  Notion ={
    { listenShortcut = COPY_URL, nativeShortcut = NOTION_COPY_URL },
    { listenShortcut = H1, nativeShortcut = NOTION_H1 },
    { listenShortcut = H2, nativeShortcut = NOTION_H2 },
    { listenShortcut = H3, nativeShortcut = NOTION_H3 },
    { listenShortcut = INLINE_CODE_BLOCK, nativeShortcut = NOTION_INLINE_CODE_BLOCK },
    { listenShortcut = CHECKBOX, nativeShortcut = NOTION_CHECKBOX },
    { listenShortcut = STRIKETHROUGH, nativeShortcut = NOTION_STRIKETHROUGH },
    { listenShortcut = BULLET_LIST, nativeShortcut = NOTION_BULLET_LIST },
    { listenShortcut = CODE_BLOCK, nativeShortcut = NOTION_CODE_BLOCK },
    { listenShortcut = NUMBERED_LIST, nativeShortcut = NOTION_NUMBERED_LIST },
    { listenShortcut = HIGHLIGHT, nativeShortcut = NOTION_HIGHLIGHT },
  },
  Slack = { -- does not support H1,H2,H3
    { listenShortcut = INLINE_CODE_BLOCK, nativeShortcut = SLACK_INLINE_CODE_BLOCK },
    { listenShortcut = STRIKETHROUGH, nativeShortcut = SLACK_STRIKETHROUGH },
    { listenShortcut = BULLET_LIST, nativeShortcut = SLACK_BULLET_LIST },
    { listenShortcut = CODE_BLOCK, nativeShortcut = SLACK_CODE_BLOCK },
    { listenShortcut = NUMBERED_LIST, nativeShortcut = SLACK_NUMBERED_LIST },
  },
  Linear = {
    { listenShortcut = COPY_URL, nativeShortcut = LINEAR_COPY_URL },
    { listenShortcut = H1, nativeShortcut = LINEAR_H1 },
    { listenShortcut = H2, nativeShortcut = LINEAR_H2 },
    { listenShortcut = H3, nativeShortcut = LINEAR_H3 },
    { listenShortcut = INLINE_CODE_BLOCK, nativeShortcut = LINEAR_INLINE_CODE_BLOCK },
    { listenShortcut = CHECKBOX, nativeShortcut = LINEAR_CHECKBOX },
    { listenShortcut = STRIKETHROUGH, nativeShortcut = LINEAR_STRIKETHROUGH },
    { listenShortcut = BULLET_LIST, nativeShortcut = LINEAR_BULLET_LIST },
    { listenShortcut = CODE_BLOCK, nativeShortcut = LINEAR_CODE_BLOCK },
    { listenShortcut = NUMBERED_LIST, nativeShortcut = LINEAR_NUMBERED_LIST },
  },
  Asana = {
    { listenShortcut = INLINE_CODE_BLOCK, nativeShortcut = ASANA_INLINE_CODE_BLOCK },
    { listenShortcut = H1, nativeShortcut = ASANA_H1 },
    { listenShortcut = H2, nativeShortcut = ASANA_H2 },
    { listenShortcut = STRIKETHROUGH, nativeShortcut = ASANA_STRIKETHROUGH },
    { listenShortcut = BULLET_LIST, nativeShortcut = ASANA_BULLET_LIST },
    { listenShortcut = CODE_BLOCK, nativeShortcut = ASANA_CODE_BLOCK },
    { listenShortcut = NUMBERED_LIST, nativeShortcut = ASANA_NUMBERED_LIST },
  },
  Reflect = {
    { listenShortcut = H1, nativeShortcut = REFLECT_H1 },
    { listenShortcut = H2, nativeShortcut = REFLECT_H2 },
    { listenShortcut = H3, nativeShortcut = REFLECT_H3 },
    { listenShortcut = CHECKBOX, nativeShortcut = REFLECT_CHECKBOX },
    { listenShortcut = STRIKETHROUGH, nativeShortcut = REFLECT_STRIKETHROUGH },
    { listenShortcut = BULLET_LIST, nativeShortcut = REFLECT_BULLET_LIST },
    { listenShortcut = NUMBERED_LIST, nativeShortcut = REFLECT_NUMBERED_LIST },
    { listenShortcut = HIGHLIGHT, nativeShortcut = REFLECT_HIGHLIGHT },
    -- Task - cmd shift 9
  },
  ["Google Chrome"] = {
    { listenShortcut = COPY_URL, nativeShortcut = CHROME_COPY_URL },
  },
  Firefox = {
    { listenShortcut = COPY_URL, nativeShortcut = FIREFOX_COPY_URL },
  },
}

--------------------------------------------
-- Flatten "shortcutsConfig" into a table --
--------------------------------------------
local function comboKey(mods, key)
  local sortedMods = {table.unpack(mods)}
  table.sort(sortedMods)
  return table.concat(sortedMods, "_") .. "_" .. key
end

local globalShortcuts = {}

for appName, shortcutList in pairs(shortcutsConfig) do
  for _, item in ipairs(shortcutList) do
    local listenMods, listenKey = table.unpack(item.listenShortcut)
    local cKey = comboKey(listenMods, listenKey)

    if not globalShortcuts[cKey] then
      globalShortcuts[cKey] = {
        mods = listenMods,
        key  = listenKey,
        apps = {},
      }
    end

    table.insert(globalShortcuts[cKey].apps, {
      name = appName,
      nativeShortcut = item.nativeShortcut,
    })
  end
end

------------------------------------------------
-- Bind a single global hotkey for each combo --
------------------------------------------------
for cKey, data in pairs(globalShortcuts) do
  hs.hotkey.bind(data.mods, data.key, function()
    local frontApp = hs.application.frontmostApplication()
    local frontAppName = frontApp and frontApp:name() or ""

    for _, appItem in ipairs(data.apps) do
      if appItem.name == frontAppName then
        local sendMods, sendKey, times = table.unpack(appItem.nativeShortcut)
        times = times or 1
        -- Optional brief delay
        hs.timer.usleep(50000)
        for i = 1, times do
          hs.eventtap.keyStroke(sendMods, sendKey)
        end
        break
      end
    end
  end)
end

