export def main [ ] {
    $in
    | each {|i| $i | to json --raw}
    | str join "\n"
    | fzf
    | from json
}
