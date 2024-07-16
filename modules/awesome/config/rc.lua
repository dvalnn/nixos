local awful = require("awful")
local menubar = require("menubar")
local beautiful = require("beautiful")

require("awful.hotkeys_popup.keys")
require("awful.autofocus")
require("startup")

local const = require("settings").constants
local apps = require("settings").default_apps
local keys = require("keys")
local buttons = require("buttons")

local theme_path = string.format(
    "%s/.config/awesome/themes/%s/theme.lua",
    const.HOME,
    const.THEME
)

beautiful.init(theme_path)

root.keys(keys.global)
root.buttons(buttons.root)

menubar.utils.terminal      = apps.terminal -- Set the terminal for applications that require it

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts        = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.fair,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
}

awful.util.tagnames         = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
awful.util.taglist_buttons  = buttons.taglist
awful.util.tasklist_buttons = buttons.tasklist

require("client.signals")
require("screen")
