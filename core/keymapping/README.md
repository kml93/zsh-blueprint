# zsh-keymapping

A professional, modular Zsh plugin for ergonomic and universal key bindings.

## Features

- **Terminfo-driven**: Uses `smkx` (Application Mode) and `terminfo` for accurate key sequence detection.
- **Xterm Fallback**: Provides reliable fallbacks for common modifier keys (Ctrl, Alt, Shift) when terminfo is missing.
- **Modular Architecture**: Separates data (mapping), logic (widgets), and actions (bindings).
- **Smart Proxies**: Decouples key bindings from external plugins like `history-substring-search`. It works if they are there, fallbacks gracefully if they aren't.
- **Smart Dot Expansion**: Expands `..` to `../..` automatically.

## Installation

### Using [Sheldon](https://github.com/rossmacarthur/sheldon)

Add the following to your `plugins.toml`:

```toml
[plugins.zsh-keymapping]
github = "kml93/zsh-blueprint"
dir = "core/keymapping"
use = "init.zsh"
apply = ["defer"]
```

### Manual

Clone this repository and source `init.zsh` in your `.zshrc`:

```zsh
source /path/core/zsh-keymapping/init.zsh
```

## Structure

- `init.zsh`: Entry point, module loading, and system hooks.
- `map.zsh`: Data layer containing the keyboard sequence dictionary.
- `widgets.zsh`: Custom ZLE widgets and smart proxies.
- `binds.zsh`: Final key-to-widget associations.

## Acknowledgements

This plugin is inspired by the established patterns and logic of **[Zim FW](https://zimfw.sh/)** and **[Oh My Zsh](https://ohmyz.sh/)**, aiming to bring their robust keyboard mapping into a standalone, modular, and modern component.

## License

MIT
