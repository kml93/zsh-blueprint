# Zsh Unified Manager Architecture

This directory contains the abstraction layer for Zsh plugin or environment management.

## Architecture

- `init.zsh`: Core dispatcher (manager command).
- `sheldon/`: Sheldon-specific implementation.

## Usage

Type `manager <command>` to interact with the current shell state.

- `manager reload`: Clears caches and restarts the zsh process.
