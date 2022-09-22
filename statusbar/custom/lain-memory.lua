-- Lain library
local lain = require("lain")
local markup = lain.util.markup

local GB_const = 0.00098
local GB_convert = function ( mb )
    return string.format("%.1f", mb * GB_const)
end

-- Memory usage
local widget_memory = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(RC.vars.font, "#ffffff", GB_convert(mem_now.used) .. " GB"))
    end
})

return widget_memory