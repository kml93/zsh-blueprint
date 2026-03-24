# ------------------------------------------------------------------------------
# Module: Zsh Key Bindings
# Purpose: Ergonomic and universal keyboard mapping
# ------------------------------------------------------------------------------

# 1. Systematically load terminfo module
zmodload -F zsh/terminfo +b:echoti +p:terminfo

# 2. Activate Application Mode (ZLE Hooks)
# Allows the terminal to send precise terminfo sequences
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
  autoload -Uz add-zle-hook-widget
  function __kb_app_mode_start() {
    echoti smkx
  }
  function __kb_app_mode_stop() {
    echoti rmkx
  }
  add-zle-hook-widget -Uz zle-line-init __kb_app_mode_start
  add-zle-hook-widget -Uz zle-line-finish __kb_app_mode_stop
fi

# 3. ZLE Base settings
setopt MULTIBYTE
bindkey -e # Default to Emacs mode

# 4. Load sub-modules
local kb_root=${${(%):-%x}:A:h}
source "${kb_root}/map.zsh"
source "${kb_root}/widgets.zsh"
source "${kb_root}/binds.zsh"

# Cleanup local temporary variables
unset kb_root
