# Create or initialize a new project with a dev template from flakehub
export def main [
    --target (-t): string, 
    --dir (-d): path = "",
] {
    let target = match $target {
        null => "empty",
        _ => $target
    }

    match $dir {
        null => { nix flake init -t $"https://flakehub.com/f/the-nix-way/dev-templates/*#($target)" },
        _ => { nix flake new -t $"https://flakehub.com/f/the-nix-way/dev-templates/*#($target)" $dir },
    }
} 
