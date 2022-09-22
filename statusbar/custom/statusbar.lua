-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

-- Wibox handling library
local wibox = require("wibox")

-- Custom Local Library: Common Functional Decoration
local deco = {
  wallpaper = require("deco.wallpaper"),
  taglist   = require("deco.taglist"),
  tasklist  = require("deco.tasklist")
}

local WB = {}
wibox_package = WB -- global object name

-- custom statusbar selper
require("statusbar.custom.helper")

WB.taglist  = deco.taglist()
WB.tasklist = deco.tasklist()

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Create Wibar

awful.screen.connect_for_each_screen(function(s)
  -- Create common widgets
  WB.setup_common_widgets(s)

  -- Create the top wibox
  WB.generate_wibox(s)
end)

