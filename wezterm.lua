local wezterm = require("wezterm")
local io = require 'io'
local os = require 'os'

local config = wezterm.config_builder()
local mux = wezterm.mux
local act = wezterm.action

config.use_fancy_tab_bar = false

config.leader = { key = '\\', mods = 'CTRL', timeout_milliseconds = 1000 }

-- Update the workspace name in window
wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)

-- Start in terminal workspace
wezterm.on('mux-startup', function()
  local _, _, window = mux.spawn_window {}
  window:set_workspace('terminal')
end)

-- Poll for workspace change in temp file
wezterm.on('poll-workspace', function(window, pane)
  local temp_file = wezterm.GLOBAL.workspace_temp_file

  local f = io.open(temp_file, 'r')
  if f ~= nil then
    local result = f:read('*l')
    f:close()

    -- Is there anything in the file?
    if result ~= nil and #result > 0 then
      os.remove(temp_file)

      local projects_dir = wezterm.home_dir .. '/Developer'

      wezterm.log_info('Selected workspace: ' .. result)
      wezterm.log_info('Working dir: ' .. projects_dir .. '/' .. result)

      window:perform_action(
        act.SwitchToWorkspace {
          name = result,
	  spawn = {
            set_environment_variables = {
              CWD = projects_dir .. '/' .. result,
            },
            args = { '/opt/homebrew/bin/fish' },
          },
        },
        pane
      )
    else
      window:perform_action(
        act.EmitEvent('poll-workspace'),
        pane
      )
    end
  end
end)

wezterm.on('switch-workspace', function(window, pane)
  local temp_file = os.tmpname()

  local projects_dir = wezterm.home_dir .. '/Developer'
  local projects = ""

  for dir in io.popen("ls " .. projects_dir):lines() do
    if projects == "" then
      projects = dir
    else
      projects = projects .. '\n' .. dir
    end
  end

  window:mux_window():spawn_tab {
    args = {
      '/opt/homebrew/bin/fish', '-c',
      string.format('echo "%s" | /opt/homebrew/bin/fzf > %s', projects, temp_file)
    },
  }

  wezterm.log_info('Waiting for fzf result...')

  wezterm.GLOBAL.workspace_temp_file = temp_file
  wezterm.log_info('Temp file: ' .. wezterm.GLOBAL.workspace_temp_file)

  window:perform_action(
    act.EmitEvent('poll-workspace'),
    pane
  )
end)

config.keys = {
  {
    key = 'S',
    mods = 'LEADER',
    action = act.ShowLauncherArgs {
      flags = 'FUZZY|WORKSPACES',
    },
  },
  {
    key = 's',
    mods = 'LEADER',
    action = act.ShowLauncherArgs {
      flags = 'WORKSPACES',
    },
  },
  {
    key = 'f',
    mods = 'LEADER',
    action = act.EmitEvent('switch-workspace'),
  },
  { key = 'L', mods = 'CTRL', action = act.ShowDebugOverlay },
}

return config
