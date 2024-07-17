local gears = require("gears")
local awful = require("awful")

local right_click_menu = require("modules.right_click_menu")

return gears.table.join(
    awful.button(
        {}, 3,
        function()
            right_click_menu:toggle()
        end
    ),

    awful.button(
        {}, 4,
        awful.tag.viewnext
    ),

    awful.button(
        {}, 5,
        awful.tag.viewprev
    )
)
