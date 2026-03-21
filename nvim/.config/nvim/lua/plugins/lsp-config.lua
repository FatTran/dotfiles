return
{
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {"lua_ls", "clangd", "rust_analyzer", "gopls", "pyright"}
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            --local lspconfig = require("lspconfig")
            vim.lsp.config("lua_ls", {capabilities = capabilities})
            vim.lsp.config("clangd", {capabilities = capabilities, fallbackFlags = {'-std=c++23'}})
            vim.lsp.config("rust_analyzer", {capabilities = capabilities})
            vim.lsp.config("gopls", {capabilities = capabilities})
            vim.lsp.config("pyright", {capabilities = capabilities})
            --lspconfig.lua_ls.setup{
            --    capabilities = capabilities
            --}
            --lspconfig.clangd.setup{
            --    capabilities = capabilities
            --}
            --lspconfig.rust_analyzer.setup{
            --    capabilities = capabilities
            --}
            --lspconfig.gopls.setup{
            --    capabilities = capabilities
            --}
            --lspconfig.pyright.setup{
            --    capabilities = capabilities
            --}
            vim.lsp.enable("lua_ls", "clangd", "rust_analyzer", "pyright", "gopls")
            vim.keymap.set('n', "K", vim.lsp.buf.hover, {})
            vim.keymap.set('n', "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set('n', "gd", vim.lsp.buf.definition, {})
            vim.keymap.set('n', "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })
        end
    },
}
