local awful = require("awful")
local gfs = require("gears.filesystem")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")

local gmc = require("theme.gmc")
local fa = require("theme.fa")

awful.util = require("awful.util")

local dpi = xresources.apply_dpi
local themes_path = gfs.get_themes_dir()
local config_path = awful.util.getdir("config") .. "/theme/"

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- default variables

local theme = {}

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

theme.wallpaper          = RC.vars.wallpaper
-- theme.wallpaper          = theme_path .. "assets/default_bg.png"
theme.awesome_icon       = config_path.."assets/arch_icon.png"
theme.awesome_subicon    = config_path.."assets/arch_icon.png"

theme.font          = RC.vars.font -- "sans 8"
-- theme.taglist_font  = "Inconsolata Medium 9"

-- theme.icon_size = 12
-- theme.icon_font = "Font Awesome 5 Free-Regular-900 " -- attention to space at the end!
-- theme.icon_color = "#587D8D"

theme.bg_normal     = RC.vars.theme_bg_1     -- .. "cc"
theme.bg_focus      = RC.vars.theme_primary  -- .. "cc"
theme.bg_urgent     = gmc.color['red500']    -- .. "cc"
theme.bg_minimize   = gmc.color['gray600']   -- .. "cc"
theme.bg_systray    = RC.vars.theme_bg_1     -- .. "cc"

theme.fg_normal     = gmc.color['white']
theme.fg_focus      = gmc.color['white']
theme.fg_urgent     = gmc.color['white']
theme.fg_minimize   = gmc.color['white']

theme.useless_gap   = dpi(10)
theme.border_width  = dpi(2)

theme.border_normal = gmc.color['gray900']    -- .. "cc"
theme.border_focus  = gmc.color['blue500']    -- .. "cc"
theme.border_marked = gmc.color['orange500']  -- .. "cc"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:

theme.taglist_bg_focus = gmc.color['blue500']     -- .. "cc"
theme.taglist_fg_focus = gmc.color['white']


theme.tasklist_bg_normal = gmc.color['gray500']   -- .. "88"
theme.tasklist_bg_focus  = gmc.color['gray700']   -- .. "88"
theme.tasklist_fg_focus  = gmc.color['white']

theme.titlebar_bg_normal = gmc.color['gray900']   -- .. "cc"
theme.titlebar_bg_focus  = gmc.color['gray900']   -- .. "cc"
theme.titlebar_fg_focus  = gmc.color['blue500']   -- .. "cc"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, gmc.color['blue500']
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, gmc.color['gray800']
)

-- Display the taglist squares

-- override
-- theme.taglist_squares_sel      = config_path .. "taglist/clone/square_sel.png"
-- theme.taglist_squares_unsel    = config_path .. "taglist/clone/square_unsel.png"

-- alternate override
-- theme.taglist_squares_sel   = config_path .. "taglist/copycat-blackburn/square_sel.png"
-- theme.taglist_squares_unsel = config_path .. "taglist/copycat-blackburn/square_unsel.png"
-- theme.taglist_squares_sel   = config_path .. "taglist/copycat-zenburn/squarefz.png"
-- theme.taglist_squares_unsel = config_path .. "taglist/copycat-zenburn/squareza.png"


-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"

theme.menu_height = 20      -- dpi(15)
theme.menu_width  = 180     -- dpi(100)
--theme.menu_context_height = 20

theme.menu_bg_normal = gmc.color['gray900']    -- .. "cc"
theme.menu_bg_focus  = gmc.color['blue500']    -- .. "cc"
theme.menu_fg_focus  = gmc.color['white']

theme.menu_border_color = gmc.color['gray900'] -- .. "cc"
theme.menu_border_width = 1

-- rounded corners
theme.rounded = dpi(6)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."default/titlebar/maximized_focus_active.png"


-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

theme.layout_tile     = config_path.."assets/layout/tile.png"
theme.layout_floating = config_path.."assets/layout/float.png"

return theme

