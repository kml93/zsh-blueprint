# ------------------------------------------------------------------------------
# Bindings Application
# ------------------------------------------------------------------------------

# Note: 'for k v in' is the correct syntax for pairs
for key widget (
  F1              run-help

  Home            beginning-of-line
  # Ctrl-Home       beginning-of-line
  # Shift-Home      beginning-of-line
  End             end-of-line
  # Ctrl-End        end-of-line
  # Shift-End       end-of-line
  Insert          overwrite-mode
  Backspace       backward-delete-char
  Delete          delete-char
  Left            backward-char
  Right           forward-char

  # Using smart proxies (Deferred resolution)
  Up              up-line-or-beginning-search
  Down            down-line-or-beginning-search
  Shift-Up        __kb_smart_up
  Shift-Down      __kb_smart_down

  PageUp          beginning-of-buffer-or-history
  PageDown        end-of-buffer-or-history
  Shift-Tab       reverse-menu-complete

  Ctrl-Left       backward-word
  Ctrl-Right      forward-word
  Alt-Left        backward-word
  Alt-Right       forward-word

  Ctrl-Backspace  backward-kill-word
  Ctrl-Delete     kill-word
  Alt-Backspace   backward-kill-word
  Alt-Delete      kill-word
) {
  if [[ -n "${keys[$key]}" ]]; then
    bindkey -- "${keys[$key]}" "$widget"
  fi
}

# Additional special bindings
bindkey "."   __kb_double_dot_expand
bindkey "^?"  __kb_double_dot_contract
bindkey "^X^U" undo
bindkey '^X^E' edit-command-line
bindkey -M isearch "." self-insert
