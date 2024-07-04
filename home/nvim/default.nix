{pkgs, ... }: 
{
    programs.neovim = {

        enable = true;
        vimAlias = true;

        extraLuaConfig = ''
        ${builtins.readFile ./lua/config.lua}
        ${builtins.readFile ./lua/treesitter.lua}
        ${builtins.readFile ./lua/nvim-tree.lua}
        '';


        plugins = with pkgs.vimPlugins; [
            # Add indentation lines
            indentLine

            # Color scheme
            {
                
                plugin = catppuccin-nvim;
                config = "colorscheme catppuccin";
            }

            # File tree
            nvim-web-devicons
            nvim-tree-lua

            # Better nix file support
            vim-nix

            nvim-treesitter
        ];
    };
}
