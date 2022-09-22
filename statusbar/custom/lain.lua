

local _W = {}

local widget_calendar = require("statusbar.custom.lain-calendar")
local widget_battery = require("statusbar.custom.lain-battery")
local widget_btc = require("statusbar.custom.lain-btc")
local widget_cpu = require("statusbar.custom.lain-cpu")
local widget_memory = require("statusbar.custom.lain-memory")
local widget_fs = require("statusbar.custom.lain-fs")
local widget_net = require("statusbar.custom.lain-net")

_W.widget = {
   ["calendar"]      = widget_calendar,
   ["battery"]       = widget_battery.perc,
   ["btc"]           = widget_btc,
   ["cpu"]           = widget_cpu.cpu,
   ["temp"]          = widget_cpu.temp,
   ["memory"]        = widget_memory,
   ["fs"]            = widget_fs,
   ["netup"]         = widget_net.up,
   ["netdown"]       = widget_net.down
}

_W.icon = {
   ["battery"] = widget_battery.icon
}

return _W