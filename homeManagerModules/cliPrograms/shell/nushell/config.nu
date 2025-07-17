$env.config.show_banner = false
$env.config.edit_mode = "vi"
$env.config.buffer_editor = "vim"
$env.EDITOR = "nvim"
$env.PATH ++= ['~/.emacs.d/bin']

$env.config.history = {
  file_format: sqlite
  max_size: 1_000_000
  sync_on_enter: true
  isolation: true
}

let default_converter = {
    from_string: {|s| $s | split row (char esep) | path expand --no-symlink }
    to_string: {|v| $v | path expand --no-symlink | str join (char esep) }
}

let paths = [
    "XDG_DATA_DIRS"
    "XDG_CONFIG_DIRS"

    "PATH"
    "INFOPATH"
    "LD_LIBRARY_PATH"
    "LIBEXEC_PATH"
    "NIX_PATH"
    "GTK_PATH"
    "QML2_IMPORT_PATH"
    "QTWEBKIT_PLUGIN_PATH"
    "QT_PLUGIN_PATH"
    "WINDOWPATH"
    "XCURSOR_PATH"
]

$env.ENV_CONVERSIONS = $env.ENV_CONVERSIONS | 
merge ($paths | reduce -f {} {|it, acc| $acc | insert $it $default_converter })

const NU_LIB_DIRS = [
    ($nu.default-config-dir | path join "modules")
    ($nu.default-config-dir | path join "scripts")
]

use task.nu

use fg.nu
use devshell.nu
use system-update.nu
use nufzf.nu
