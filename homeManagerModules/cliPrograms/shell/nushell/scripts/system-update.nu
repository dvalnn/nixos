export def main [ ] {
    # go to nixos configuration directory
    use std/dirs shells-aliases *

    enter ~/nixos

    # update the system
    nh os switch --update --ask

    # get the current generation of the system
    let commit_msg = nixos-rebuild list-generations
    | detect columns
    | reject NixOS Configuration Revision Specialisation
    | where { |gen| $gen.Current == True }
    | format pattern "{Generation} current {Build-date} {version} {Kernel}"
    | get 0

    git commit -am $commit_msg
    git push

    dexit
}

export def clean [ ] {
    use std/dirs shells-aliases *

    enter ~/nixos
    git reset --hard HEAD
    dexit
}
