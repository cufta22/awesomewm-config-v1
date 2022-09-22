-- Wibox handling library
local wibox = require("wibox")

local lain = require("lain")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Textclock
local widget_textclock = wibox.widget.textclock()

-- Attach calendar
lain.widget.cal({
    attach_to = { widget_textclock },
    notification_preset = {
        font = "Terminus 10",
        fg   = RC.vars.theme_fg,
        bg   = RC.vars.theme_bg_1
    }
})

return widget_textclock