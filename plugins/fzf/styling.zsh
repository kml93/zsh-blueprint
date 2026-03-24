# Configuration visuelle pour fzf-tab
# Prévisualisation des groupes de complétion
zstyle ":fzf-tab:*" group-colors \
  $"\033[38;5;12m" $"\033[38;5;13m" $"\033[38;5;14m" $"\033[38;5;15m"

# Prévisualisation du contenu des répertoires pour "cd"
zstyle ":fzf-tab:complete:cd:*" fzf-preview "ls --color=always $realpath"
