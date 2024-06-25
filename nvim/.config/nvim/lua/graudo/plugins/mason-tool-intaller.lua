return {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    ensure_installed = {
        "stylua", -- Lua formatting
        "rust_analyzer",
        "tsserver",
        "pyright",
        "html",
        "jsonls",
        "gopls",
        "astro",
        "dockerls",
        "docker_compose_language_service"
    },
    auto_update = false,
    run_on_start = true,
    start_delay = 1000,
    integrations = {
        ['mason-lspconfig'] = true,
    }
}
