#!/usr/bin/env zsh

# export TERM="rxvt-256color"
export TERM="xterm-256color"

# +-----+
# | XDG |
# +-----+

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${XDG_CONFIG_HOME}/cache"
export XDG_LOCAL_HOME="${XDG_CONFIG_HOME}/local"
export XDG_BIN_HOME="${XDG_LOCAL_HOME}/bin"
export XDG_LIB_HOME="${XDG_LOCAL_HOME}/lib"
export XDG_OPT_HOME="${XDG_LOCAL_HOME}/opt"
export XDG_DATA_HOME="${XDG_LOCAL_HOME}/share"
export XDG_STATE_HOME="${XDG_LOCAL_HOME}/state"
# export HOST

[[ ":${PATH}:" != *":${XDG_BIN_HOME}:"* ]] && export PATH="${XDG_BIN_HOME}:${PATH}"

# +-----+
# | ZSH |
# +-----+

export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export ZDOTLIB="${ZDOTDIR}/lib"
export ZDOTPLUGINS="${ZDOTDIR}/plugins"
export ZDOTTHEMES="${ZDOTDIR}/themes"
export ZDOTCOMPLETIONS="${ZDOTDIR}/completions"
export ZSH_CACHE_DIR="${ZDOTDIR}/cache"
export SHELDON_CONFIG_DIR="${ZDOTDIR}"
export SHELDON_CONFIG_FILE="${SHELDON_CONFIG_DIR}/plugins.toml"

# +--------+
# | EDITOR |
# +--------+

# Preferred editor for local or remote sessions
if [[ -n ${SSH_CONNECTION} ]]; then
  export EDITOR="nano"
else
  if command -v zeditor >/dev/null 2>&1; then
    export EDITOR="zeditor"
  elif command -v code >/dev/null 2>&1; then
    export EDITOR="code --wait --new-window"
  else
    export EDITOR="nano"
  fi
fi

export VISUAL="${EDITOR}"

# +---------+
# | HISTORY |
# +---------+

export HISTFILE="${ZDOTDIR}/.zsh_history"
export HISTSIZE=999999  # the number of items for the internal history list
export SAVEHIST=1000000 # maximum number of items for the history file
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S "


# +-------------+
# | KEY-MAPPING |
# +-------------+

export WORDCHARS="~!#%^&*(){}[]<>?+;_-."

# +-------+
# | OTHER |
# +-------+

export FORCE_COLOR=1
export DO_NOT_TRACK=1

# +-----------+
# | XDG-NINJA |
# +-----------+

export LESSHISTFILE="${XDG_CACHE_HOME}/less/history"

# +-----+
# | BUN |
# +-----+

export BUN_INSTALL_GLOBAL_DIR="${XDG_DATA_HOME}/bun/global"
export BUN_INSTALL_BIN="${XDG_LOCAL_HOME}"
export BUN_INSTALL="${BUN_INSTALL_BIN}"
export BUN_INSTALL_CACHE_DIR="${XDG_CACHE_HOME}/bun"
export BUN_RUNTIME_TRANSPILER_CACHE_PATH="${BUN_INSTALL_CACHE_DIR}/transpiler"

# +--------+
# | CLAUDE |
# +--------+

export CLAUDE_CONFIG_DIR="${XDG_CONFIG_HOME}/claude"

# +-----+
# | FNM |
# +-----+

export FNM_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}/fnm"

# +--------+
# | GEMINI |
# +--------+

export GEMINI_TELEMETRY_ENABLED="0"

# +----+
# | UV |
# +----+

export UV_CACHE_DIR="${XDG_CACHE_HOME:-${HOME}/.cache}/uv"
export UV_PYTHON_INSTALL_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}/uv/python"
export UV_PYTHON_CACHE_DIR="${XDG_CACHE_HOME:-${HOME}/.cache}/uv/python"
export UV_PYTHON_BIN_DIR="${XDG_BIN_HOME:-${HOME}/.local/bin}"
export UV_TOOL_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}/uv/tools"
export UV_TOOL_BIN_DIR="${XDG_BIN_HOME:-${HOME}/.local/bin}"
export UV_CREDENTIALS_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}/uv/credentials"
export UV_PROJECT_ENVIRONMENT=".venv"
export UV_INSTALL_DIR="${XDG_BIN_HOME}"

# +-----------+
# | WORDPRESS |
# +-----------+

export WP_CLI_NAME=wp-cli
export WP_CLI_CACHE_DIR="${XDG_CACHE_HOME}/${WP_CLI_NAME}"
export WP_CLI_CONFIG_PATH="${XDG_CONFIG_HOME}/${WP_CLI_NAME}/config.yml"
export WP_CLI_PACKAGES_DIR="${XDG_DATA_HOME}/${WP_CLI_NAME}"