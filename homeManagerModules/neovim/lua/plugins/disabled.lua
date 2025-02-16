return {
    { "folke/noice.nvim",                  enabled = false },
    -- { "rcarriga/nvim-notify",              enabled = false },
    -- WARN: do not enable these on NixOs
    { "williamboman/mason.nvim",           enabled = false },
    { "williamboman/mason-lspconfig.nvim", enabled = false },
    { "jay-babu/mason-nvim-dap.nvim",      enabled = false },
    -- WARN: only enable themes if stylix target is disabled
    { "folke/tokyonight.nvim",             enabled = false },
    { "catppuccin",                        enabled = false },
}
