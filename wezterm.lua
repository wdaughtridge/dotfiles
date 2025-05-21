local wezterm = require('wezterm')
local io = require('io')
local os = require('os')

local config = wezterm.config_builder()
local action = wezterm.action
local projects_dir = wezterm.home_dir .. '/Developer'

local home = os.getenv("HOME")
local light = io.open(home .. "/.lightmode","r")
if light ~= nil then
  io.close(light)
  config.color_scheme = 'Windows 10 Light (base16)'
else
  config.color_scheme = 'Windows 10 (base16)'
end

-- Opacity
-- This is not so nice when stage manager is off
config.window_background_opacity = 0.9

-- Make tabs look retro
config.use_fancy_tab_bar = false

-- Old tmux leader I am used to
config.leader = {
  key = '\\',
  mods = 'CTRL',
  timeout_milliseconds = 1000
}

-- Update the workspace name in window
wezterm.on('update-right-status', function(window, _)
  window:set_right_status(window:active_workspace())
end)

-- Poll for workspace change in temp file
wezterm.on('poll-workspace', function(window, pane)
  -- This is set in the caller when workspace change is requested. I do wish
  -- we could pass this as an argument though
  local temp_file = wezterm.GLOBAL.workspace_temp_file

  -- Try to open the temp file which will probably always work
  local f = io.open(temp_file, 'r')
  if f ~= nil then
    local result = f:read('*l')
    f:close()

    -- Is there anything in the file?
    if result ~= nil and #result > 0 then
      os.remove(temp_file)

      wezterm.log_info('Selected workspace: ' .. result)
      wezterm.log_info('Working dir: ' .. projects_dir .. '/' .. result)

      -- Actually switch to the new workspace with some environment
      -- variables set. My fish config checks for CWD, and if it is
      -- present, cd's to it
      window:perform_action(
        action.SwitchToWorkspace {
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
      -- Recurse!
      window:perform_action(
        action.EmitEvent('poll-workspace'),
        pane
      )
    end
  end
end)

-- Gitui
wezterm.on('gitui', function(window, _)
  window:mux_window():spawn_tab {
    args = {
      '/opt/homebrew/bin/gitui'
    },
  }
end)

wezterm.on('switch-workspace', function(window, pane)
  local temp_file = os.tmpname()
  local projects = ''

  -- Just list out files in the projects dir... I wonder if there
  -- is a better way to do this without invoking ls
  for dir in io.popen('ls ' .. projects_dir):lines() do
    if projects == '' then
      projects = dir
    else
      projects = projects .. '\n' .. dir
    end
  end

  -- Think we need to invoke a shell here due to how fzf works, but
  -- maybe not?
  window:mux_window():spawn_tab {
    args = {
      '/opt/homebrew/bin/fish', '-c',
      string.format('echo "%s" | /opt/homebrew/bin/fzf > %s', projects, temp_file)
    },
  }

  -- TODO: can we pass this as an argument?
  wezterm.GLOBAL.workspace_temp_file = temp_file
  wezterm.log_info('Temp file: ' .. wezterm.GLOBAL.workspace_temp_file)

  -- Actually poll for a response from user
  window:perform_action(
    action.EmitEvent('poll-workspace'),
    pane
  )
end)

config.keys = {
  {
    key = 'w',
    mods = 'LEADER',
    action = action.ShowLauncherArgs {
      flags = 'FUZZY|WORKSPACES',
    },
  },
  {
    key = 's',
    mods = 'LEADER',
    action = action.ShowLauncherArgs {
      flags = 'WORKSPACES',
    },
  },
  {
    key = 't',
    mods = 'LEADER',
    action = action.SwitchToWorkspace {
      name = 'default',
    },
  },
  {
    key = 'g',
    mods = 'LEADER',
    action = action.EmitEvent('gitui'),
  },
  {
    key = 'f',
    mods = 'LEADER',
    action = action.EmitEvent('switch-workspace'),
  },
  {
    key = 'L',
    mods = 'CTRL',
    action = action.ShowDebugOverlay
  },
}

return config
