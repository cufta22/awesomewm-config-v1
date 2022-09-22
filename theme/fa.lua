-- FontAwesome icons
-- Browse icons: https://fontawesome.com/

local wibox = require("wibox")
local gmc = require("theme.gmc")
-- Associative Array (Hash)

local _M = {}

local icon_size = 14
local icon_font = "Font Awesome 6 Free, Regular " -- attention to space at the end!
local icon_color = gmc.color["white"]


local function make_fa_icon( code, color )
    color = color or icon_color

    return wibox.widget{
      markup = ' <span color="'.. color ..'">' .. code .. '</span>  ',
      align  = 'center',
      valign = 'center',
      widget = wibox.widget.textbox,
      font = icon_font .. icon_size,
    }
end

_M.icon = {
    -- Battery icons
    ["battery_full"] = make_fa_icon('\u{f240}', gmc.color["green400"]),     -- full
    ["battery_3"] = make_fa_icon('\u{f241}'),                               -- 3/4
    ["battery_2"] = make_fa_icon('\u{f242}'),                               -- 2/4
    ["battery_1"] = make_fa_icon('\u{f243}', gmc.color["orange500"]),       -- 1/4
    ["battery_empty"] = make_fa_icon('\u{f244}', gmc.color["red500"]),      -- empty
    ["battery_charging"] = make_fa_icon('\u{f0e7}', gmc.color["yellow500"]),

    -- Memory icon
    ["memory"] = make_fa_icon('\u{f538}', gmc.color["green500"]),

    -- Weather icons
    ["weather_cloud"] = make_fa_icon('\u{f0c2}'),
    ["weather_sun"] = make_fa_icon('\u{f185}'),

    -- CPU icon
    ["cpu"] = make_fa_icon('\u{f2db}', gmc.color["teal300"]),

    -- Disk icon
    ["disk"] = make_fa_icon('\u{f51f}', gmc.color["purple400"]),

    -- Network icons
    ["network_globe"] = make_fa_icon('\u{f0ac}', gmc.color["blue400"]),
    ["network_wifi"] = make_fa_icon('\u{f1eb}', gmc.color["blue400"]),

    -- Temperature
    ["temperature"] = make_fa_icon('\u{f769}', gmc.color["deepOrange400"]),

    -- Volume icons
    ["volume_3"] = make_fa_icon('\u{f028}'),
    ["volume_2"] = make_fa_icon('\u{f027}'),
    ["volume_1"] = make_fa_icon('\u{f026}'),
    ["volume_off"] = make_fa_icon('\u{f6a9}'),

    -- Calendar icons
    ["calendar"] = make_fa_icon('\u{f133}'),
    ["clock"] = make_fa_icon('\u{f017}'),

    -- BTC
    ["btc"] = make_fa_icon('\u{f379}', gmc.color["yellow600"]),

    -- Loading icon
    ["loading"] = make_fa_icon('\u{f110}', gmc.color["blue200"]),
}

return _M