local gears = require("gears")
local awful = require("awful")

return {
    custom = gears.table.join(
        awful.button(
            {}, 1,
            function(c)
                if c == client.focus then
                    c.minimized = true
                else
                    -- Without this, the following
                    -- :isvisible() makes no sense
                    c.minimized = false
                    if not c:isvisible() and c.first_tag then
                        c.first_tag:view_only()
                    end
                    -- This will also un-minimize
                    -- the client, if needed
                    client.focus = c
                    c:raise()
                end
            end
        ),

        awful.button({}, 3, function(c) c.kill(c) end),
        awful.button({}, 4, function() awful.client.focus.byidx(1) end),
        awful.button({}, 5, function() awful.client.focus.byidx(-1) end)
    ),

    default = gears.table.join(
        awful.button(
            {}, 1,
            function(c)
                if c == client.focus then
                    c.minimized = true
                else
                    c:emit_signal(
                        "request::activate",
                        "tasklist",
                        {
                            raise = true,
                        }
                    )
                end
            end
        ),
        awful.button(
            {}, 3,
            function()
                awful.menu.client_list(
                    {
                        theme = {
                            width = 250
                        }
                    }
                )
            end
        ),
        awful.button({}, 4, function() awful.client.focus.byidx(1) end),
        awful.button({}, 5, function() awful.client.focus.byidx(-1) end)
    )
}
