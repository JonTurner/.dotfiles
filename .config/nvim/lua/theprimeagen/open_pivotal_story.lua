local M = {}

function M.OpenPivotalStory(sha)
    local handle = io.popen("git show -q --oneline " .. sha .. " | tail -n1 | awk '{print $2}' | sed 's/[^0-9]*//g'")
    local pivotal_story_id = handle:read("*a")
    handle:close()

    pivotal_story_id = pivotal_story_id:gsub('\n', '')

    local url = 'https://www.pivotaltracker.com/story/show/' .. pivotal_story_id

    vim.api.nvim_exec('call netrw#BrowseX("' .. url .. '", 0)', false)
end

return M

