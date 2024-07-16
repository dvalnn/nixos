local awful = require("awful")
local beautiful = require("beautiful")

-- Rules to be managed by the manage signal
awful.rules.rules = require("client.rules")

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
        and not c.size_hints.user_position
        and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal(
    "request::titlebars",
    function(c)
        local titlebar = require("widgets").titlebar(c)
        awful.titlebar(c):setup(titlebar)
    end
)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter",
    function(c)
        c:emit_signal(
            "request::activate", "mouse_enter",
            {
                raise = false
            }
        )
    end
)

local function color_func(beatiful_param)
    return function(c)
        c.border_color = beatiful_param
    end
end

client.connect_signal("focus", color_func(beautiful.border_focus))
client.connect_signal("unfocus", color_func(beautiful.border_normal))
