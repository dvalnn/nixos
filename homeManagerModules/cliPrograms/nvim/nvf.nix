{
  inputs,
  config,
  lib,
  user,
  pkgs,
  ...
}: {
  imports = [inputs.nvf.homeManagerModules.default];

  options = {
    nvf.enable = lib.mkEnableOption "enable nvf neovim config";
  };

  config.programs = {
    nvf =
      lib.mkIf config.nvf.enable {
        enable = true;
        defaultEditor = true;

        settings = {
          vim = {
            viAlias = false;
            vimAlias = true;

            options = {
              #indentation
              smartindent = true;
              autoindent = true;
              tabstop = 4;
              shiftwidth = 4;
              shiftround = true;
              expandtab = true;

              # search
              hlsearch = false;
              incsearch = true;

              # display
              wrap = false;
              smartcase = true;
              updatetime = 50;
              hidden = true;
              shortmess = "atI";
            };

            extraPlugins = with pkgs.vimPlugins; {
              harpoon = {
                package = harpoon2;
                # TODO: source this from a file
                setup = "
local conf = require('telescope.config').values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    local make_finder = function()
        local paths = {}
        for _, item in ipairs(harpoon_files.items) do
            table.insert(paths, item.value)
        end

        return require('telescope.finders').new_table(
            {
                results = paths
            }
        )
    end


    require('telescope.pickers').new({}, {
        prompt_title = 'Harpoon',
        finder = require('telescope.finders').new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_buffer_number, map)
            -- Delete selected entry from the list
            map('i', '<C-d>', function()
                local state = require('telescope.actions.state')
                local selected_entry = state.get_selected_entry()
                local current_picker = state.get_current_picker(prompt_buffer_number)
                table.remove(harpoon_files.items, selected_entry.index)
                current_picker:refresh(make_finder())
            end)

            return true
        end
    }):find()
end
                                ";
              };

              undoTree = {
                package = undotree;
              };
            };

            keymaps = [
              # normal mode
              {
                key = "<C-d>";
                mode = "n";
                silent = true;
                action = "<C-d>zz";
              }
              {
                key = "<C-u>";
                mode = "n";
                silent = true;
                action = "<C-u>zz";
              }
              {
                key = "J";
                mode = "n";
                silent = true;
                action = "mzJ`z";
              }
              {
                key = "n";
                mode = "n";
                silent = true;
                action = "nzzzv";
              }
              {
                key = "N";
                mode = "n";
                silent = true;
                action = "Nzzzv";
              }
              {
                key = "Q";
                mode = "n";
                silent = true;
                action = "<Nop>";
              }
              # TODO: make this some other way
              # {
              #   key = "<leader>r";
              #   mode = "n";
              #   action = "[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]";
              #   desc = "vim rename under cursor";
              # }
              # visual mode
              {
                key = "J";
                mode = "v";
                silent = true;
                action = ":m '>+1<CR>gv=gv";
                desc = "Move selected lines down";
              }
              {
                key = "K";
                mode = "v";
                silent = true;
                action = ":m '<-2<CR>gv=gv";
                desc = "Move selected lines up";
              }

              #Plugin Specific
              {
                key = "<leader>u";
                mode = "n";
                action = "<cmd>UndotreeToggle<CR>";
                desc = "Toggle Undoo Tree";
              }
            ];

            autocomplete = {
              nvim-cmp = {
                enable = true;
                sourcePlugins = ["cmp-path" "cmp-buffer" "crates-nvim"];
                sources = {
                  buffer = "[Buffer]";
                  path = "[Path]";
                  nvim_lsp = "[LSP]";
                  crates = "[Crates]";
                };
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

            dashboard = {
              startify = {
                enable = true;
                customHeader = ["startify#center(startify#fortune#cowsay())"];
              };
            };

            filetree = {
              nvimTree = {
                enable = true;
                setupOpts = {
                  git.enable = true;
                  modified.enable = true;
                  update_focused_file.enable = true;
                  view = {
                    centralize_selection = true;
                    relativenumber = true;
                    side = "right";
                  };
                };
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
              colorizer.enable = true;
              fastaction.enable = true;
              smartcolumn.enable = true;
            };

            undoFile = {
              enable = true;
              path = "/home/${user.name}/.vimUndo";
            };
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
