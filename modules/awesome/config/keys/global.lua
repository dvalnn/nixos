local gears = require("gears")
local awful = require("awful")

-- Widget and layout library
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

local mod_key = require("keys").mod.mod_key
local apps = require("settings").default_apps

local mymainmenu = require "widgets".right_click_menu

local global_keys = gears.table.join(

-- Miscelaneous bindings
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

    -- Standard program
    awful.key(
        { mod_key, }, "Return",
        function()
            awful.spawn(apps.terminal)
        end,
        {
            description = "open a terminal",
            group = "launcher"
        }
    ),

    awful.key(
        { mod_key, }, "b",
        function()
            awful.spawn(apps.browser)
        end,
        {
            description = "open the defined browser",
            group = "launcher"
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
    ),

    -- Prompt
    awful.key(
        { mod_key }, "r",
        function()
            awful.screen.focused().mypromptbox:run()
        end,
        {
            description = "run prompt",
            group = "launcher"
        }),

    awful.key(
        { mod_key }, "x",
        function()
            awful.prompt.run {
                prompt       = "Run Lua code: ",
                textbox      = awful.screen.focused().mypromptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval"
            }
        end,
        {
            description = "lua execute prompt",
            group = "awesome"
        }),

    -- Menubar
    awful.key(
        { mod_key }, "p",
        function()
            menubar.show()
        end,
        {
            description = "show the menubar",
            group = "launcher"
        }
    )
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    global_keys = gears.table.join(global_keys,
        -- View tag only.
        awful.key(
            { mod_key }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            {
                description = "view tag #" .. i,
                group = "tag"
            }
        ),

        -- Toggle tag display.
        awful.key(
            { mod_key, "Control" }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            {
                description = "toggle tag #" .. i,
                group = "tag"
            }
        ),

        -- Move client to tag.
        awful.key(
            { mod_key, "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            {
                description = "move focused client to tag #" .. i,
                group = "tag"
            }
        ),

        -- Toggle tag on focused client.
        awful.key(
            { mod_key, "Control", "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            {
                description = "toggle focused client on tag #" .. i,
                group = "tag"
            }
        )
    )
end

return global_keys
