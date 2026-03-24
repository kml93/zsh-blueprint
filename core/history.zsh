#!/usr/bin/env zsh

# +---------+
# | HISTORY |
# +---------+

# The meaning of these options can be found in man page of `zshoptions`.
setopt EXTENDED_HISTORY       # Record command start time
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS      # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space.
setopt HIST_REDUCE_BLANKS     # Remove unnecessary blanks
setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file.
setopt HIST_VERIFY            # Do not execute immediately upon history expansion.
setopt INC_APPEND_HISTORY
setopt INC_APPEND_HISTORY_TIME # append command to history file immediately after execution
setopt SHARE_HISTORY
