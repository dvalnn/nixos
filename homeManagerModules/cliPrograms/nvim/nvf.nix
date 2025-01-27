{
  inputs,
  config,
  lib,
  ...
}: {
  imports = [inputs.nvf.homeManagerModules.default];

  options = {
    nvf.enable = lib.mkEnableOption "enable nvf neovim config";
  };

  config.programs = {
    nvf = lib.mkIf config.nvf.enable {
      enable = true;
      defaultEditor = true;

      settings = {
        vim = {
          viAlias = false;
          vimAlias = true;

          autocomplete = {
            nvim-cmp = {
              enable = true;
            };
          };

          autopairs = {
            nvim-autopairs.enable = true;
          };

          assistant.copilot = {
            enable = true;
            cmp = {
              enable = true;
            };
          };

          binds = {
            whichKey = {
              enable = true;
            };
          };

          comments = {
            comment-nvim = {
              enable = true;
            };
          };

          filetree = {
            nvimTree = {
              enable = true;
            };
          };

          git = {
            gitsigns = {
              enable = true;
              codeActions.enable = true;
            };
            vim-fugitive = {
              enable = false;
            };
          };

          languages = {
            # general
            enableLSP = true;
            enableFormat = true;
            enableTreesitter = true;
            enableExtraDiagnostics = true;

            # other languages
            bash.enable = true;
            nix.enable = true;
            sql.enable = true;
            markdown.enable = true;

            # scripting languages
            lua.enable = true;
            python.enable = true;

            # web languages
            ts.enable = true;
            html.enable = true;
            css.enable = true;

            # systems languages
            clang.enable = true;
            go.enable = true;
            rust.enable = true;
            zig.enable = true;
          };

          lsp = {
            enable = true;
            formatOnSave = true;
            trouble = {
              enable = true;
            };
          };

          mini = {
            ai.enable = true;
            icons.enable = true;
            indentscope.enable = true;
            jump.enable = true;
            surround.enable = true;
          };

          notes = {
            todo-comments = {
              enable = true;
            };
          };

          snippets = {
            luasnip = {
              enable = true;
            };
          };

          spellcheck = {
            enable = true;
            programmingWordlist.enable = true;
          };

          statusline = {
            lualine = {
              enable = true;
              theme = "gruvbox";
            };
          };

          syntaxHighlighting = true;

          telescope = {
            enable = true;
          };

          terminal = {
            toggleterm = {
              enable = true;
              lazygit.enable = true;
            };
          };

          theme = {
            enable = true;
            name = "gruvbox";
            style = "dark";
          };

          ui = {
            modes-nvim.enable = true;
            colorizer.enable = true;
            fastaction.enable = true;
            smartcolumn.enable = true;
          };

          undoFile.enable = true;
          useSystemClipboard = true;

          utility = {
            motion = {
              leap.enable = true;
            };
            yanky-nvim.enable = true;
          };

          visuals = {
            fidget-nvim.enable = true;
            highlight-undo.enable = true;
            indent-blankline.enable = true;
            nvim-cursorline.enable = true;
            nvim-web-devicons.enable = true;
          };

          # lazy.plugins = with pkgs.vimPlugins; {
          #   "harpoon" = {
          #     package = harpoon;
          #     setup = "require('harpoon').setup{}";
          #   };
          # };
        };
      };
    };
  };
}
