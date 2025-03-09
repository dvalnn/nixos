$env.config.edit_mode = "vi"
$env.config.buffer_editor = "vim"

$env.config.history = {
  file_format: sqlite
  max_size: 1_000_000
  sync_on_enter: true
  isolation: true
}

def default_converter [] {
    {
        from_string: {|s| $s | split row (char esep) | path expand --no-symlink }
        to_string: {|v| $v | path expand --no-symlink | str join (char esep) }
    }
}

$env.ENV_CONVERSIONS = $env.ENV_CONVERSIONS | merge {
    "PATH": default_converter
    "PYTHONPATH": default_converter

    "XDG_DATA_DIRS": default_converter
    "XDG_CONFIG_DIRS": default_converter
}

$env.config.show_banner = false
