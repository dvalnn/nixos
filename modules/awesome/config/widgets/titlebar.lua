local awful = require("awful")
local wibox = require("wibox")

return function(client)
    local buttons = require("buttons").titlebar(client)
    return {
        { -- Left
            awful.titlebar.widget.iconwidget(client),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(client)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton(client),
            awful.titlebar.widget.maximizedbutton(client),
            awful.titlebar.widget.stickybutton(client),
            awful.titlebar.widget.ontopbutton(client),
            awful.titlebar.widget.closebutton(client),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end
