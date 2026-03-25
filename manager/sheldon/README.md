# Sheldon Manager Extension

This component handles the integration between the unified `manager` command and the **Sheldon** plugin manager.

## Features

- **Adapter Logic**: Maps generic `manager` calls to Sheldon actions.
- **CLI Wrapper**: Provides a `sheldon` function override to support `sheldon reload`.

## Implementation

The `init.zsh` file implements the **Dynamic Dispatch** pattern. Any function named `_sheldon::[cmd]` is automatically exposed as a `sheldon [cmd]` sub-command.

Current extensions:

- **`_sheldon::reload`**: Delegates the shell reload to the unified `manager reload`.
