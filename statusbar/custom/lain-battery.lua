-- Standard awesome library
local awful     = require("awful")
local xresources = require("beautiful.xresources")
local gears = require("gears")
local gmc   = require("theme.gmc")

-- Wibox library
local wibox = require("wibox")

-- Lain library
local lain = require("lain")

local fa = require("theme.fa")

local dpi = xresources.apply_dpi

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Battery

-- fa.icon["battery_full"]
-- local icon_battery_dynamyc = fa.icon["loading"]

local icon_battery_dynamyc = wibox.widget{
    markup = ' <span color="'.. gmc.color["white"] ..'">' .. '\u{f240}' .. '</span> ',
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox,
    font = "Font Awesome 6 Free, Regular 14",
}

local widget_battery_perc = wibox.widget{
    markup = ' test ',
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox,
}

lain.widget.bat({
    timeout = 3, -- Refresh rate
    settings = function()
        local new_img, perc = "", tonumber(bat_now.perc) or 0

        if perc <= 10 then
            new_img = ' <span color="'.. gmc.color["red500"] ..'">' .. '\u{f244}' .. '</span> '
        elseif perc <= 30 then
            new_img = ' <span color="'.. gmc.color["orange500"] ..'">' .. '\u{f243}' .. '</span> '
        elseif perc <= 50 then
            new_img = ' <span color="'.. gmc.color["white"] ..'">' .. '\u{f242}' .. '</span> '
        elseif perc <= 70 then
            new_img = ' <span color="'.. gmc.color["white"] ..'">' .. '\u{f241}' .. '</span> '
        elseif perc <= 100 then
            new_img = ' <span color="'.. gmc.color["green400"] ..'">' .. '\u{f240}' .. '</span> '
        end

        if bat_now.ac_status == 1 then
            new_img = ' <span color="'.. gmc.color["yellow500"] ..'">' .. '\u{f0e7}' .. '</span> '
        end


        widget_battery_perc:set_markup(" " .. perc .. "%")
        icon_battery_dynamyc:set_markup(new_img)

        if bat_now.ac_status == "N/A" and perc == 0 then
            icon_battery_dynamyc:set_markup(' <span color="'.. gmc.color["blue200"] ..'">' .. '\u{f110}' .. '</span> ')
            widget_battery_perc:set_markup("")
        end
    end
})

return {
    ["icon"] = icon_battery_dynamyc,
    ["perc"] = widget_battery_perc
}