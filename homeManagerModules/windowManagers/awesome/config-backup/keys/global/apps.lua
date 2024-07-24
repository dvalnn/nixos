local gears = require("gears")
local awful = require("awful")

local apps = require("settings").default_apps
local mod_key = require("keys.mod").mod_key

local menubar = require("menubar")

return gears.table.join(
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
        {  }, "Print",
        function()
            awful.spawn(apps.screenshot)
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
