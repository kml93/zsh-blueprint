#!/usr/bin/env zsh
# ------------------------------------------------------------------------------
# UNIFIED MANAGER : CORE DISPATCHER
# ------------------------------------------------------------------------------
# Description: Provides a common interface for shell management actions.
# Pattern: Strategy Pattern (Delegates to ZSH_PLUGIN_MANAGER implementation).
# ------------------------------------------------------------------------------

# --- 1. GENERIC INTERFACE : RELOAD ---
# Unified entry point for reloading the shell session.
function _manager::reload {
  # Perform generic cleanup before delegating or executing
  local comp_file="${ZSH_COMPDUMP:-${ZDOTDIR:-$HOME}/.zcompdump}"
  command rm -f "$comp_file" "${comp_file}.zwc"

  # Delegate implementation to the current active manager if available
  # OR execute default reload logic if no specific implementation exists.
  local impl="_manager::${ZSH_PLUGIN_MANAGER:-vanilla}::reload"
  
  if (( ${+functions[$impl]} )); then
    $impl "$@"
  else
    # Default fallback reload logic (Senior Standard)
    local zsh="${ZSH_ARGZERO:-${functrace[-1]%:*}}"
    [[ "$zsh" = -* || -o login ]] && exec -l "${zsh#-}" || exec "$zsh"
  fi
}

# --- 2. PUBLIC CLI WRAPPER ---
# Main entry point for the user. Ex: 'manager reload'
function manager {
  local sub_cmd="$1"

  # Route to internal manager functions
  if (( ${+functions[_manager::$sub_cmd]} )); then
    shift
    _manager::$sub_cmd "$@"
  else
    echo "Error: Manager command '$sub_cmd' not implemented."
    return 1
  fi
}
