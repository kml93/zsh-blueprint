#!/usr/bin/env zsh
# ------------------------------------------------------------------------------
# UNIFIED MANAGER : SHELDON IMPLEMENTATION
# ------------------------------------------------------------------------------
# Description: Sheldon-specific bindings for the manager interface.
# ------------------------------------------------------------------------------

# --- 1. RELOAD BINDING ---
function _manager::sheldon::reload {
  # Sheldon-specific pre-reload actions can go here (e.g., sheldon lock)
  # For now, we reuse the core reload logic by not blocking it.
  
  # Standard Zsh reload behavior
  local zsh="${ZSH_ARGZERO:-${functrace[-1]%:*}}"
  [[ "$zsh" = -* || -o login ]] && exec -l "${zsh#-}" || exec "$zsh"
}

# --- 2. CLI OVERRIDE (DYNAMIC DISPATCH) ---
# Extends Sheldon CLI with custom sub-commands defined as _sheldon::[cmd]
function sheldon {
  local sub_cmd="$1"

  # Check for custom implementation first
  if (( ${+functions[_sheldon::$sub_cmd]} )); then
    shift
    _sheldon::$sub_cmd "$@"
  else
    # Fallback to the real Sheldon binary
    command sheldon "$@"
  fi
}

# --- 3. CUSTOM SHELDON SUB-COMMANDS ---
# Map 'sheldon reload' to the unified 'manager reload'
function _sheldon::reload {
  manager reload
}
