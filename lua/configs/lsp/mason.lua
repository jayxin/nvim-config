local M = {}

function M.config()
  local status_ok, _ = pcall(require, 'mason')
  if not status_ok then return end

  _.setup({
    ui = {
      check_outdated_packages_on_open = false,
      border = 'none',
      icons = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗',
      },
      keymaps = {
        toggle_package_expand = '<CR>',
        install_package = 'i',
        update_package = 'u',
        check_package_version = 'c',
        update_all_packages = 'U',
        check_outdated_packages = 'C',
        uninstall_package = 'X',
        cancel_installation = '<C-c>',
        apply_language_filter = '<C-f>',
      },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,

    --install_root_dir = path.concat { vim.fn.stdpath "data", "mason" },

    pip = {
      -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
      -- and is not recommended.
      -- Example: { "--proxy", "https://proxyserver" }
      install_args = {},
    },

    github = {
      -- The template URL to use when downloading assets from GitHub.
      -- The placeholders are the following (in order):
      -- 1. The repository (e.g. "rust-lang/rust-analyzer")
      -- 2. The release version (e.g. "v0.3.0")
      -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
      --download_url_template = "https://github.com/%s/releases/download/%s/%s",
    },
  })
end

return M
