
local gears = require("gears")

local utils = {}

-- Create rounded rectangle shape (in one line)

utils.rrect = function(radius)
    return function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, radius)
    end
end

return utils