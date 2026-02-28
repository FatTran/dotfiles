return {
    'windwp/nvim-autopairs',
    event = "InsertEnter", -- Lazy-load the plugin on entering insert mode
    config = function()
        require("nvim-autopairs").setup {
            check_ts = true, -- Optional: use treesitter to check context
        }
    end
}
