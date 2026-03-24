# ------------------------------------------------------------------------------
# Keyboard Sequence Mapping (Data Layer)
# ------------------------------------------------------------------------------

typeset -gA keys

# Standard modifiers (xterm convention)
local -A mods=( 2 Shift 3 Alt 4 Alt-Shift 5 Ctrl 6 Ctrl-Shift 7 Ctrl-Alt 8 Ctrl-Alt-Shift )

# Family 1 : ^[[1;N... (Arrows, Home, End)
for i code (${(kv)mods}) {
  for char ti name (
    A kUP   Up
    B kDN   Down
    C kRIT  Right
    D kLFT  Left
    F kEND  End
    H kHOM  Home
  ) {
    keys[${code}-${name}]="${terminfo[k${ti}${i}]:-^[[1;${i}${char}}"
  }
}

# Family 2 : ^[[X;N~ (Insert, Delete, PageUp, PageDown)
for i code (${(kv)mods}) {
  for char ti name (
    2 kIC   Insert
    3 kDC   Delete
    5 kPP   PageUp
    6 kNP   PageDown
  ) {
    keys[${code}-${name}]="${terminfo[k${ti}${i}]:-^[[${char};${i}~}"
  }
}

# Base keys & Fallbacks
keys+=(
  F1              "${terminfo[kf1]:-^[OP}"
  F2              "${terminfo[kf2]:-^[OQ}"
  F3              "${terminfo[kf3]:-^[OR}"
  F4              "${terminfo[kf4]:-^[OS}"
  F5              "${terminfo[kf5]:-^[[15~}"
  F6              "${terminfo[kf6]:-^[[17~}"
  F7              "${terminfo[kf7]:-^[[18~}"
  F8              "${terminfo[kf8]:-^[[19~}"
  F9              "${terminfo[kf9]:-^[[20~}"
  F10             "${terminfo[kf10]:-^[[21~}"
  F11             "${terminfo[kf11]:-^[[23~}"
  F12             "${terminfo[kf12]:-^[[24~}"

  Up              "${terminfo[kcuu1]:-^[[A}"
  Down            "${terminfo[kcud1]:-^[[B}"
  Left            "${terminfo[kcub1]:-^[[D}"
  Right           "${terminfo[kcuf1]:-^[[C}"

  End             "${terminfo[kend]:-^[[F}"
  Home            "${terminfo[khome]:-^[[H}"
  Insert          "${terminfo[kich1]:-^[[2~}"
  Delete          "${terminfo[kdch1]:-^[[3~}"
  PageUp          "${terminfo[kpp]:-^[[5~}"
  PageDown        "${terminfo[knp]:-^[[6~}"

  Ctrl            '^'
  Ctrl-Space      '^@'
  Ctrl-Backspace  '^H'
  Backspace       "${terminfo[kbs]:-^?}"
  Tab             "\t"
  Shift-Tab       "${terminfo[kcbt]:-^[[Z}"
)
