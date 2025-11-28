
---@type vim.lsp.Config
return {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = vim.loop.cwd(),  -- you can customize this to use LSP's root detection
    settings = {
        -- tsserver doesn't require much custom settings, but you can pass preferences here
        typescript = {
            format = {
                enable = true,  -- enable formatting
            },
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
        javascript = {
            format = {
                enable = true,
            },
        },
    },
}
