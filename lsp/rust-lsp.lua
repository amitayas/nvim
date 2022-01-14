--require'lspconfig'.rust_analyzer.setup{}
--
local nvim_lsp = require'lspconfig'

nvim_lsp.rust_analyzer.setup({
    capabilities=capabilities,
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true,
                autoreload = true,
                allFeatures = true,
            },
            procMacro = {
                enable = true
            },
            checkOnSave = {
                enable = true,
                command = "clippy",
            },
        },
    }
})
