require("after.lang.lsp")
require("after.lang.cmp")
require("after.lang.rust")
require("after.lang.java")

require("nvim-treesitter.configs").setup{
    -- Do not ensure installed here, grammar packs are installed through nix
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
