local gears = require("gears")
local awful = require("awful")

-- Widget and layout library
local mod_key = require("keys.mod").mod_key
local global_keys = gears.table.join(
    require("keys.global.apps"),
    require("keys.global.awesome")
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
