#!/usr/bin/env zsh

# ------------------------------------------------------------------------------
# ZSH BLUEPRINT : BOOTSTRAPPER 
# ------------------------------------------------------------------------------
# Role: Orchestrate shell startup in Sheldon or Vanilla (Legacy) mode.
# ------------------------------------------------------------------------------

# 1. FLAGS CONFIGURATION
# ZSH_PLUGIN_MANAGER can be overridden in .zshenv or via environment variable.
ZSH_PLUGIN_MANAGER="${ZSH_PLUGIN_MANAGER:-sheldon}"

# 2. DIRECTORIES & COMPLETION ENVIRONMENT
[[ -d "${ZDOTCOMPLETIONS}" ]] || mkdir -p "${ZDOTLIB}" "${ZDOTTHEMES}" "${ZSH_CACHE_DIR}" "${ZDOTCOMPLETIONS}"

fpath=(${ZDOTCOMPLETIONS} ${fpath})

# 3. LOADING BIFURCATION (Case Statement)
case "${ZSH_PLUGIN_MANAGER}" in
  sheldon)
    if (( $+commands[sheldon] )); then
      # Sheldon will load the manager extension via plugins.toml
      eval "$(sheldon source)"
    else
      # Automatic fallback to Vanilla if Sheldon is missing
      source "${ZDOTDIR}/core/vanilla.zsh"
    fi
    ;;
  *)
    # Forced Vanilla mode (Legacy) or unknown
    source "${ZDOTDIR}/core/vanilla.zsh"
    ;;
esac

# --- BOOTSTRAP NOTE ---
# For automatic installation, you could add here:
# if ! (( $+commands[sheldon] )); then _blueprint::install_sheldon; fi
