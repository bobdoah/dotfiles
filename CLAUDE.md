# CLAUDE.md — AI Assistant Guide for bobdoah/dotfiles

This file provides context for AI assistants (Claude Code, Copilot, etc.) working in this repository.

## What This Repository Is

A personal dotfiles repository for a DevOps/Cloud engineer's development environment. It manages shell, editor, terminal, and tool configurations using [Dotbot](https://github.com/anishathalye/dotbot) for installation and symlinking.

## Installation

```bash
cd ~
git clone git@github.com:bobdoah/dotfiles.git
cd dotfiles
./install
```

The `./install` script:
1. Initializes all git submodules recursively
2. Installs tmux plugins via TPM (if tmux is installed)
3. Symlinks config files to their correct locations in `$HOME` and `~/.config/`
4. Registers ASDF plugins (terraform-validator, terraform-docs, k9s)

## Repository Structure

```
dotfiles/
├── install                  # Dotbot runner script (executable)
├── install.conf.yaml        # Dotbot symlink/clean/shell configuration
├── gitconfig                # Git configuration (symlinked to ~/.gitconfig)
├── zshrc                    # Zsh main config (symlinked to ~/.zshrc)
├── zshenv                   # Zsh environment variables (symlinked to ~/.zshenv)
├── tmux.conf                # Tmux config (symlinked to ~/.tmux.conf)
├── tool-versions            # ASDF tool versions (symlinked to ~/.tool-versions)
├── .stylua.toml             # Stylua Lua formatter config (2-space indent, single quotes)
├── config/
│   ├── nvim/                # Neovim config (symlinked to ~/.config/nvim/)
│   │   ├── init.lua         # Main Kickstart.nvim config (~955 lines)
│   │   └── lua/custom/plugins/  # Modular plugin overrides
│   ├── alacritty/           # Alacritty terminal (Catppuccin Macchiato theme)
│   ├── kitty/               # Kitty terminal (Catppuccin themes)
│   ├── k9s/                 # K9s Kubernetes TUI (Catppuccin skins)
│   ├── sql-lint/            # SQL linter config (PostgreSQL dialect)
│   └── yamllint/            # YAML linter config
├── zsh/
│   ├── completions/         # Custom zsh completions (_kubectx, _kubens, _aws-profile)
│   └── functions/           # Autoloaded zsh functions (aws-profile)
├── cowsay/                  # Custom cowsay ASCII art files
├── asdf/                    # ASDF version manager (git submodule)
├── dotbot/                  # Dotbot installer (git submodule)
├── dotbot-asdf/             # Dotbot ASDF plugin (git submodule)
├── dotbot-crossplatform/    # Dotbot cross-platform plugin (git submodule)
├── tmux/plugins/tpm/        # Tmux Plugin Manager (git submodule)
└── zgen/                    # Zgen zsh plugin manager (git submodule)
```

## Key Technologies

| Area | Tool |
|---|---|
| Shell | Zsh + Oh-My-Zsh (via zgen) |
| Terminal | Alacritty / Kitty |
| Editor | Neovim (Kickstart.nvim + Lazy.nvim) |
| Terminal multiplexer | Tmux + TPM |
| Version management | ASDF |
| Dotfile installation | Dotbot |
| Theme | Catppuccin Macchiato (consistent across all tools) |
| Cloud/IaC | Terraform, kubectl, helm, kustomize, flux, argocd, K9s |
| AI in editor | GitHub Copilot + CodeCompanion (disabled by default) |

## Development Conventions

### Lua (Neovim config)
- Formatter: **Stylua** — 2-space indentation, single quotes, `column_width = 120`
- Plugin manager: **Lazy.nvim** with lazy loading (use `event`, `cmd`, `keys` conditions)
- Custom plugins go in `config/nvim/lua/custom/plugins/<name>.lua`
- Feature flags: `vim.g.enable_ai` and `vim.g.copilot_enabled` gate AI features
- Toggle these flags in `config/nvim/init.lua` to enable/disable Copilot and CodeCompanion

### YAML
- Validated with **yamllint** (config in `config/yamllint/`)
- Use 2-space indentation, no trailing spaces

### Shell (Zsh)
- New completions go in `zsh/completions/_<command_name>` following zsh compdef conventions
- New autoloaded functions go in `zsh/functions/`
- Private/sensitive shell config belongs in `~/.zsh/private` (not tracked)

### Git
- Commit message style: `type: description` (e.g., `feat:`, `fix:`, `chore:`, `refactor:`)
- Default branch: `master`
- Merge tool: `nvimdiff`
- Local git overrides go in `~/.gitconfig.local` (not tracked)

## Adding New Dotfiles

1. Place the config file in the repo (e.g., `config/mytool/config.yaml`)
2. Add a symlink entry to `install.conf.yaml` under the `link:` section
3. For cross-platform paths, use the `dotbot-crossplatform` plugin syntax
4. Run `./install` to apply

## Local Override Patterns

These files are loaded by configs but not tracked in the repo (put personal/machine-specific settings here):

| File | Used by |
|---|---|
| `~/.gitconfig.local` | gitconfig |
| `~/.tmux_local.conf` | tmux.conf |
| `~/.zsh/private` | zshrc (sourced automatically) |

## Submodules

All submodules are initialized by the `./install` script. To update them manually:

```bash
git submodule update --init --recursive
git submodule update --remote   # update to latest upstream
```

Key submodules: `dotbot`, `dotbot-asdf`, `dotbot-crossplatform`, `asdf`, `zgen`, `tmux/plugins/tpm`

## Neovim Custom Plugins (`config/nvim/lua/custom/plugins/`)

| File | Purpose |
|---|---|
| `catppuccin.lua` | Catppuccin Macchiato colorscheme |
| `copilot.lua` | GitHub Copilot (conditional on `vim.g.copilot_enabled`) |
| `codecompanion.lua` | AI chat assistant via Copilot adapter |
| `filetree.lua` | Neo-tree file explorer |
| `fugitive.lua` | Git integration with custom keymaps |
| `neotest.lua` | Test runner (golang-focused) |
| `lint.lua` | Linting (hadolint for Dockerfiles, golangci-lint for Go) |
| `format_cmds.lua` | `:FormatDisable` / `:FormatEnable` commands |
| `surround.lua` | vim-surround text object plugin |
| `tilt.lua` | Tilt local dev environment support |

## Common Tasks

### Run linters manually
```bash
yamllint config/yamllint/       # validate yamllint config itself
sql-lint --driver postgres      # SQL linting
```

### Neovim: toggle AI features
In `config/nvim/init.lua`, set these near the top:
```lua
vim.g.enable_ai = true          -- enables CodeCompanion
vim.g.copilot_enabled = true    -- enables GitHub Copilot
```

### Tmux: install/update plugins
Inside a tmux session, press `<prefix>I` to install plugins and `<prefix>U` to update them. Prefix is `Ctrl+Space` by default.

### ASDF: install tool versions
```bash
asdf install   # installs all versions in .tool-versions
```

## Things to Be Careful About

- **Do not commit secrets** — AWS credentials, SSH keys, or tokens belong in `~/.zsh/private` or local override files
- **Submodule changes** — if you edit files inside a submodule directory, you are modifying the submodule's tracked commit, not the dotfiles repo itself
- **install.conf.yaml paths** — paths in the `link:` section are relative to the repo root; double-check before adding new entries
- **Cross-platform links** — K9s config uses `dotbot-crossplatform` because the config path differs between macOS and Linux; follow the same pattern for other OS-specific paths
- **Relink on changes** — after editing `install.conf.yaml`, re-run `./install` to apply symlink changes
