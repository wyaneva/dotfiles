# Misc
# ---------------------------
setopt ignoreeof            # Prevent Ctrl-D from exiting
setopt promptsubst          # Allow parameter, command, etc, in prompt
setopt transient_rprompt    # Hide RPROMPT after cmdline is executed

# History & History Expansion
# ---------------------------
setopt extendedhistory      # Save timestamps in history
setopt histignoredups       # Ignore consecutive dups
setopt histfindnodups       # Backwards search produces diff result each time
setopt histreduceblanks     # Compact consecutive white space chars
setopt incappendhistory     # Incrementally add items to HISTFILE

HISTSIZE=500000
if (( ! EUID )); then
  HISTFILE=~/.history_root
else
  HISTFILE=~/.history
fi
SAVEHIST=500000
