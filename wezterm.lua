local wezterm = require("wezterm")

local config = wezterm.config_builder()
local mux = wezterm.mux
local act = wezterm.action

config.use_fancy_tab_bar = false

wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)

config.leader = { key = '\\', mods = 'CTRL', timeout_milliseconds = 1000 }

wezterm.on('gui-startup', function(cmd)
  local args = {}
  if cmd then
    args = cmd.args
  end

  local projects_dir = wezterm.home_dir .. '/Developer'

  for dir in io.popen("ls " .. projects_dir):lines() do
    local tab, pane, window = mux.spawn_window {
      workspace = dir,
      cwd = projects_dir .. '/' .. dir,
    }
  end

  local tab, pane, window = mux.spawn_window {
    workspace = 'terminal',
  }

  mux.set_active_workspace 'terminal'
end)

config.keys = {
  {
    key = 't',
    mods = 'LEADER',
    action = act.SwitchToWorkspace {
      name = 'terminal',
    },
  },
  {
    key = 'f',
    mods = 'LEADER',
    action = act.ShowLauncherArgs {
      flags = 'FUZZY|WORKSPACES',
    },
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter name for new workspace' },
      },
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:perform_action(
            act.SwitchToWorkspace {
              name = line,
            },
            pane
          )
        end
      end),
    },
  },
}

return config
