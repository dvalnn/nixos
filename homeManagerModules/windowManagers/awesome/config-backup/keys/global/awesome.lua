local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

local mod_key = require("keys.mod").mod_key

return gears.table.join(
    awful.key(
        { mod_key, }, "s",
        hotkeys_popup.show_help,
        {
            description = "show help",
            group = "awesome"
        }
    ),

    awful.key(
        { mod_key, }, "Left",
        awful.tag.viewprev,
        {
            description = "view previous",
            group = "tag"
        }
    ),

    awful.key(
        { mod_key, }, "Right",
        awful.tag.viewnext,
        {
            description = "view next",
            group = "tag"
        }
    ),

    awful.key(
        { mod_key, }, "Escape",
        awful.tag.history.restore,
        {
            description = "go back",
            group = "tag"
        }
    ),

    awful.key(
        { mod_key, }, "j",
        function()
            awful.client.focus.byidx(1)
        end,
        {
            description = "focus next by index",
            group = "client"
        }
    ),

    awful.key(
        { mod_key, }, "k",
        function()
            awful.client.focus.byidx(-1)
        end,
        {
            description = "focus previous by index",
            group = "client"
        }
    ),

    awful.key(
        { mod_key, }, "w",
        function()
            mymainmenu:show()
        end,
        {
            description = "show main menu",
            group = "awesome"
        }
    ),

    -- Layout manipulation
    awful.key(
        { mod_key, "Shift" }, "j",
        function()
            awful.client.swap.byidx(1)
        end,
        {
            description = "swap with next client by index",
            group = "client"
        }
    ),

    awful.key(
        { mod_key, "Shift" }, "k",
        function()
            awful.client.swap.byidx(-1)
        end,
        {
            description = "swap with previous client by index",
            group = "client"
        }
    ),

    awful.key(
        { mod_key, "Control" }, "j",
        function()
            awful.screen.focus_relative(1)
        end,
        {
            description = "focus the next screen",
            group = "screen"
        }
    ),

    awful.key(
        { mod_key, "Control" }, "k",
        function()
            awful.screen.focus_relative(-1)
        end,
        {
            description = "focus the previous screen",
            group = "screen"
        }
    ),

    awful.key(
        { mod_key, }, "u",
        awful.client.urgent.jumpto,
        {
            description = "jump to urgent client",
            group = "client"
        }
    ),

    awful.key(
        { mod_key, }, "Tab",
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {
            description = "go back",
            group = "client"
        }
    ),

    awful.key(
        { mod_key, "Control" }, "r",
        awesome.restart,
        {
            description = "reload awesome",
            group = "awesome"
        }
    ),

    awful.key(
        { mod_key, "Shift" }, "q",
        awesome.quit,
        {
            description = "quit awesome",
            group = "awesome"
        }
    ),

    awful.key(
        { mod_key, }, "l",
        function()
            awful.tag.incmwfact(0.05)
        end,
        {
            description = "increase master width factor",
            group = "layout"
        }
    ),

    awful.key(
        { mod_key, }, "h",
        function()
            awful.tag.incmwfact(-0.05)
        end,
        {
            description = "decrease master width factor",
            group = "layout"
        }
    ),

    awful.key(
        { mod_key, "Shift" }, "h",
        function()
            awful.tag.incnmaster(1, nil, true)
        end,
        {
            description = "increase the number of master clients",
            group = "layout"
        }
    ),

    awful.key(
        { mod_key, "Shift" }, "l",
        function()
            awful.tag.incnmaster(-1, nil, true)
        end,
        {
            description = "decrease the number of master clients",
            group = "layout"
        }
    ),

    awful.key(
        { mod_key, "Control" }, "h",
        function()
            awful.tag.incncol(1, nil, true)
        end,
        {
            description = "increase the number of columns",
            group = "layout"
        }
    ),

    awful.key(
        { mod_key, "Control" }, "l",
        function()
            awful.tag.incncol(-1, nil, true)
        end,
        {
            description = "decrease the number of columns",
            group = "layout"
        }
    ),

    awful.key(
        { mod_key, }, "space",
        function()
            awful.layout.inc(1)
        end,
        {
            description = "select next",
            group = "layout"
        }
    ),

    awful.key(
        { mod_key, "Shift" }, "space",
        function()
            awful.layout.inc(-1)
        end,
        {
            description = "select previous",
            group = "layout"
        }
    ),

    awful.key(
        { mod_key, "Control" }, "n",
        function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                c:emit_signal(
                    "request::activate", "key.unminimize", { raise = true }
                )
            end
        end,
        {
            description = "restore minimized",
            group = "client"
        }
    )
)
