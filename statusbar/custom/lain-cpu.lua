-- Lain library
local lain = require("lain")
local markup = lain.util.markup

-- CPU
local widget_cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(RC.vars.font, "#ffffff", cpu_now.usage .. "% "))
    end
})

-- Coretemp
local widget_temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.fontfg(RC.vars.font, "#ffffff", coretemp_now .. "°C "))
    end
})

return {
    ["cpu"] = widget_cpu,
    ["temp"] = widget_temp
}
