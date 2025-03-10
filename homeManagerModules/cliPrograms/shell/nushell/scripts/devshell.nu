export def main [
    --target (-t): string, 
    --dir (-d): path,
] {
    let target = match $target {
        null => "empty",
        _ => $target
    }

    let op = match $dir {
        null => "init",
        _ => "new"
    }

    nix flake $op -t $"https://flakehub.com/f/the-nix-way/dev-templates/*#($target)" $dir
} 
