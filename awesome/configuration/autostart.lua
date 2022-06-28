local awful = require("awful")
local filesystem = require("gears.filesystem")
local config_dir = filesystem.get_configuration_dir()
local helpers = require("helpers")

local function autostart_apps()
	--- Compositor
	helpers.run.check_if_running("picom --experimental-backends", nil, function()
		awful.spawn("picom --experimental-backends --config " .. config_dir .. "configuration/picom.conf", false)
	end)
	--- Music Server

	--- Polkit Agent

	--- Other stuff
	helpers.run.run_once_grep("blueman-applet")
	helpers.run.run_once_grep("nm-applet")

	awful.spawn.with_shell("fcitx5")
---	awful.spawn("feh --bg-fill --randomize ~/Moichi_Lin/wallpaper/*")
end

autostart_apps()
