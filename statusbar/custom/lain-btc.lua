-- Standard awesome library
local awful = require("awful")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local widget_btc = awful.widget.watch(
    "curl -m5 -s 'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd'",
    43200, -- half day
    function(widget, stdout)
        -- local btc, pos, err = require("dkjson").decode(stdout, 1, nil) -- dkjson
        local btc, pos, err = require("lain.util").dkjson.decode(stdout, 1, nil) -- lain
        local btc_price = (not err and btc and btc["bitcoin"]["usd"]) or "N/A"

        -- customize here
        widget:set_text(string.format("%.0f", tonumber(btc_price)))
    end
)


return widget_btc