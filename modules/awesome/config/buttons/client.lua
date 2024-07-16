local gears = require("gears")
local awful = require("awful")

local mod_key = require("keys.mod").mod_key

return gears.table.join(
        awful.button(
            {}, 1,
            function(c)
                c:emit_signal(
                    "request::activate",
                    "mouse_click",
                    {
                        raise = true
                    }
                )
            end),

        awful.button(
            { mod_key }, 1,
            function(c)
                c:emit_signal(
                    "request::activate",
                    "mouse_click",
                    {
                        raise = true
                    }
                )
                awful.mouse.client.move(c)
            end),

        awful.button(
            { mod_key }, 3,
            function(c)
                c:emit_signal(
                    "request::activate",
                    "mouse_click",
                    {
                        raise = true
                    }
                )
                awful.mouse.client.resize(c)
            end)
    )

