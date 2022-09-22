-- Wibox handling library
local wibox = require("wibox")

-- Lain library
local lain = require("lain")
local markup = lain.util.markup

local widget_netdown = wibox.widget.textbox()
local widget_netup = lain.widget.net({
    settings = function()
        widget:set_markup(markup.fontfg(RC.vars.font, "#ffffff", net_now.sent .. " "))
        widget_netdown:set_markup(markup.fontfg(RC.vars.font, "#ffffff", net_now.received .. " "))
    end
})

return {
    ["up"] = widget_netup,
    ["down"] = widget_netdown
}