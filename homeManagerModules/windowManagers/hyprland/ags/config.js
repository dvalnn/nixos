import StatusLine from './windows/statusline/StatusLine.js'
import Sidebar from './windows/sidebar/Sidebar.js'
import Wallpapers from './windows/wallpapers/Wallpapers.js'

App.config ({
    style: App.configDir + '/out.css',
    windows: [
        // Argument is monitor id
        // check with "hyprctl monitors all"
        StatusLine(1),
        Sidebar(1),
        Wallpapers(1)
    ]
})
