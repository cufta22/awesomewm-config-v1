-- Required libraries
-- Standard awesome library
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- Wibox handling library
local wibox = require("wibox")
local lain  = require("lain")

-- Custom Local Library
local wgt = require("statusbar.custom.lain")
local utils = require("statusbar.custom.utils")

local gmc = require("theme.gmc")
local fa = require("theme.fa")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local WB = wibox_package

-- Decorations

-- Spacer
WB.spacer = wibox.widget.textbox(" ")
WB.spacerL = wibox.widget.textbox("   ")
WB.spacerXL = wibox.widget.textbox("     ")

WB.spacerline = wibox.widget.textbox(" | ")

-- Separators lain
local separators  = lain.util.separators
WB.arrow_1 = function ( color ) return separators.arrow_left("alpha", color) end
WB.arrow_2 = function ( color ) return separators.arrow_left(color, "alpha") end

WB.widget_wrap = function ( color, widget, icon )
  icon = icon or nil
  return wibox.container.background(
    wibox.container.margin(
      wibox.widget { icon, widget, layout = wibox.layout.align.horizontal },
      dpi(4),
      dpi(7)
    )
  , color)
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function WB.add_widgets_left (s)
  return {
    layout = wibox.layout.fixed.horizontal,
    margins = { top = dpi(10), bottom = dpi(14) },

    WB.spacerXL,
    wibox.container.margin(
      wibox.widget { RC.launcher, layout = wibox.layout.align.horizontal },
      0,
      0,
      dpi(3),
      dpi(3)
    ),
    WB.spacerXL,
    WB.spacerXL,

    -- s.taglist,
    wibox.container.margin(
      wibox.widget { s.taglist, layout = wibox.layout.align.horizontal },
      0,
      0,
      dpi(4),
      dpi(4)
    ),

    WB.spacerXL,
    s.promptbox,
  }
end

function WB.add_widgets_middle (s)
  return nil        -- Nothing in the middle
  -- return s.tasklist
end

function WB.add_widgets_right (s)
  return {
    layout = wibox.layout.fixed.horizontal,

    -- Widget: BTC
    WB.spacerXL,
    fa.icon["btc"],
    wgt.widget["btc"],
    WB.spacerL,


    -- Widget: FS
    WB.arrow_1(gmc.color["gray850"]),
    WB.widget_wrap(gmc.color["gray850"], wgt.widget["fs"], fa.icon["disk"]),
    WB.arrow_2(gmc.color["gray850"]),

    -- Widget: MEM
    WB.spacerL,
    fa.icon["memory"],
    wgt.widget["memory"],
    WB.spacerL,

    -- Widget: CPU
    WB.arrow_1(gmc.color["gray850"]),
    WB.widget_wrap(gmc.color["gray850"], wgt.widget["cpu"], fa.icon["cpu"]),
    WB.arrow_2(gmc.color["gray850"]),

    -- Widget: Temp
    WB.spacerL,
    fa.icon["temperature"],
    wgt.widget["temp"],
    WB.spacerL,

    -- Widget: Battery
    WB.arrow_1(gmc.color["gray850"]), 
    WB.widget_wrap(gmc.color["gray850"], wgt.widget["battery"], wgt.icon["battery"]),
    WB.arrow_2(gmc.color["gray850"]),

    -- Widget: Keyboard layout
    -- awful.widget.keyboardlayout(),
    -- WB.spacer,

    -- Systray
    WB.spacer,
    wibox.container.margin(
      wibox.widget { wibox.widget.systray(), layout = wibox.layout.fixed.horizontal},
      0,
      0,
      dpi(4),
      dpi(4)
    ),
    WB.spacerL,

    -- Widget: Clock & Calendar
    WB.arrow_1(gmc.color["gray850"]),
    WB.widget_wrap(
      gmc.color["gray850"],
      wgt.widget["calendar"]
      -- fa.icon["clock"]
    ),
    WB.arrow_2(gmc.color["gray850"]),
    WB.spacerL,

    -- Layouts,
    s.layoutbox,
    WB.spacerXL,
  }
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Function to update the tags
local update_tags = function(self, c3)
	local tagicon = self:get_children_by_id('icon_role')[1]

	if c3.selected then
    tagicon.markup = '<span color="'.. gmc.color["blue300"] ..'">' .. " \u{f192} " .. '</span>'
	else
    tagicon.markup = '<span color="'.. gmc.color["blue300"] ..'">' .. " \u{f111} " .. '</span>'
	end

  self:connect_signal('mouse::enter', function()
    if c3.selected == false then
      tagicon.markup = '<span color="'.. gmc.color["blue300"] ..'">' .. " \u{f057} " .. '</span>'
    end
  end)
  self:connect_signal('mouse::leave', function()
      if c3.selected == false then
        tagicon.markup = '<span color="'.. gmc.color["blue300"] ..'">' .. " \u{f111} " .. '</span>'
      end
  end)
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Wibar common widgets

function WB.setup_common_widgets (s)
  -- Wallpaper
  set_wallpaper(s)

  -- Create a promptbox for each screen
  s.promptbox = awful.widget.prompt()

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.layoutbox = awful.widget.layoutbox(s)
  s.layoutbox:buttons(gears.table.join(
    awful.button({ }, 1, function () awful.layout.inc( 1) end),
    awful.button({ }, 3, function () awful.layout.inc(-1) end),
    awful.button({ }, 4, function () awful.layout.inc( 1) end),
    awful.button({ }, 5, function () awful.layout.inc(-1) end)
  ))

  -- Create a taglist widget
  s.taglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = WB.taglist,
    layout = {
      spacing = 2,
      layout = wibox.layout.fixed.horizontal
    },
    widget_template = {
      {
        id = 'icon_role',
        font = "Font Awesome 6 Free, Regular 11",
        -- markup = '<span color="'.. "#000000" ..'">' .. " \u{f192} " .. '</span>',
        widget = wibox.widget.textbox,
      },
      -- id = 'background_role',
      widget = wibox.container.background,

      create_callback = function(self, c3, index, objects)
        update_tags(self, c3)
      end,

      update_callback = function(self, c3, index, objects)
        update_tags(self, c3)
      end
	  },
  }

  -- Create a tasklist widget
  s.tasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = WB.tasklist
  }
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function WB.generate_wibox (s)
  local screen_width = s.geometry.width

  -- Create the wibox
  s.wibox = awful.wibar({
    position  = "top",
    screen    = s,
    height    = dpi(30),
    width     = screen_width - beautiful.useless_gap * 4,
    shape     = utils.rrect(beautiful.rounded),
  })

  s.wibox.y = beautiful.useless_gap

  -- Add widgets to the wibox
  s.wibox:setup {
    layout = wibox.layout.align.horizontal,

    WB.add_widgets_left (s),
    WB.add_widgets_middle (s),
    WB.add_widgets_right (s),
  }
end
