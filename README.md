# zsh-blueprint

A professional, monolithic, and agnostic toolkit for Zsh. Built with enterprise-grade standards to provide a robust, performant, and portable shell environment.

## 🏛 Architecture

This project follows a **Monolithic & Flat** structure where the entire repository serves as your `${ZDOTDIR}`.

- **Flat Monolith**: Every configuration file (engine, plugins, themes) lives in one repository for atomic consistency.
- **Agnostic Logic**: Features (like FZF, Bun, or UV) are detected and configured dynamically. The shell remains functional even if tools are missing.
- **Sheldon Orchestration**: Dependencies and internal modules are managed via `plugins.toml` using the `::` namespace convention.

## 📁 Structure

- `.zshenv`: Single source of truth for the shell environment (XDG, Paths, Tooling).
- `.zshrc`: Shell loader that initializes P10k and Sheldon.
- `plugins.toml`: The orchestrator and manifesto of the monolith.
- `core/`: Agnostic shell engine (Options, History, Keybindings).
- `plugins/`: Internal toolkit-specific enhancements (e.g., FZF installer).

## 🚀 Getting Started

### Installation

1. Clone the repository directly as your `${ZDOTDIR}` (usually `~/.config/zsh`):

   ```zsh
   git clone https://github.com/kml93/zsh-blueprint.git ~/.config/zsh
   ```

2. (Optional) Set up the entry point in `/etc/zsh/zshenv` or your host-side `.zshenv`:

   ```zsh
   export XDG_CONFIG_HOME="$HOME/.config"
   export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
   ```

3. (Optional) Create a symlink from your entrypoint to `${HOME}/.zshenv`:

   ```zsh
   ln -s ${HOME}/.config/zsh/.zshenv ${HOME}/.zshenv
   ```

### Customization

To add your own machine-specific configuration without polluting the repository:

1. Use `.local.zsh` for environment variables or aliases.
2. It is already added to `.gitignore`.

## 🛠 Internal Modules

- `zsh-core::engine`: Core Zsh options and history logic.
- `zsh-core::keys`: Advanced, terminfo-driven keyboard mapping.
- `fzf::setup`: Self-healing, zero-config FZF installer and manager.

## ⚖️ License

MIT
