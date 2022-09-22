-- Lain library
local lain = require("lain")

local calc_left = function ( left )
    return string.format("%.0f", left)
end

-- Home directory
local widget_fs = lain.widget.fs({
    settings  = function()
        widget:set_text(
            "/home: " ..  fs_now["/home"].percentage .. "% "
            -- .. "(" .. calc_left(fs_now["/home"].free) .. " " .. string.upper(fs_now["/home"].units) .. " left)"
        )
    end
})

return widget_fs