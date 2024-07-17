local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")

local apps = require ("settings").default_apps

local menu = {
    {
        "hotkeys",
        function()
            hotkeys_popup.show_help(nil, awful.screen.focused())
        end
    },
    {
        "manual",
        apps.terminal .. " -e man awesome"
    },
    {
        "restart",
        awesome.restart
    },
    {
        "quit",
        function()
            awesome.quit()
        end
    },
}

return awful.menu({
    items = {
        { "awesome",       menu, beautiful.awesome_icon },
        { "open terminal", apps.terminal }
    }
})
