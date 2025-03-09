# Cd to a subdirectory of the selected directory using skim for preview
export def main [dir: path = .] {
    ls -a $dir | sk --format {get name} --preview {} | cd $in.name
}
