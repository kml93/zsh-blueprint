#!/usr/bin/env zsh

[[ -d "${ZDOTCOMPLETIONS}" ]] || mkdir -p "${ZDOTLIB}" "${ZDOTTHEMES}" "${ZSH_CACHE_DIR}" "${ZDOTCOMPLETIONS}"

fpath=(${ZDOTCOMPLETIONS} ${fpath})

eval "$(sheldon source)"
