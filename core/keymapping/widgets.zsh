# ------------------------------------------------------------------------------
# ZLE Widgets & Dynamic Proxies
# ------------------------------------------------------------------------------

# Loading useful system widgets
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

autoload -Uz edit-command-line
zle -N edit-command-line

# Smart expansion (.. -> ../..)
__kb_double_dot_expand() {
  if [[ ${LBUFFER} == (|*[[:space:]!\"\&\'/\;\<\>|]).. && -z ${RBUFFER} ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
zle -N __kb_double_dot_expand

# Smart contraction (Backspace on ../.. -> ..)
__kb_double_dot_contract() {
  if [[ ${LBUFFER} == *../.. && -z ${RBUFFER} ]]; then
    LBUFFER=${LBUFFER::-2}
  fi
  zle backward-delete-char
}
zle -N __kb_double_dot_contract

# Proxy for deferred loading (History Substring Search)
# Calls external plugin if exists, otherwise standard fallback.
__kb_smart_up() {
  if (( ${+functions[history-substring-search-up]} )); then
    zle history-substring-search-up
  else
    zle up-line-or-beginning-search
  fi
}
zle -N __kb_smart_up

__kb_smart_down() {
  if (( ${+functions[history-substring-search-down]} )); then
    zle history-substring-search-down
  else
    zle down-line-or-beginning-search
  fi
}
zle -N __kb_smart_down
