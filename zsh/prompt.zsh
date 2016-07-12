autoload -U colors && colors

green="%{[0;32m%}"
cyan="%{[0;36m%}"

# bold (grey is actually bold black)
grey="%{[01;30m%}"

white="%{[0;37m%}"
bwhite="%{[01;37m%}"

normal="%{[0m%}"

vim_ins_mode="%{$cyan%}[INS]%{$reset_color%}"
vim_cmd_mode="%{$green%}[CMD]%{$reset_color%}"

# start in insert mode
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode and you'd be prompted with CMD mode
# indicator, while in fact you would be in INS mode Fixed by catching SIGINT
# (C-c), set vim_mode to INS and then repropagate the SIGINT, so if anything
# else depends on it, we will not break it Thanks Ron! (see comments)
function TRAPINT() {
  vim_mode=$vim_ins_mode
  return $(( 128 + $1 ))
}

vim_time_prompt() {
  colour1=$white
  colour2=$bwhite
  colour3=$grey
  colour4=$normal
  PROMPT='${colour4}[$colour4%D{%H:%M}$colour4] $vim_mode $colour4($colour4%n$colour4)%#$normal '
  RPROMPT='${colour1}[$colour2%D{%H:%M}$colour1] $vim_mode $colour1($colour2%n$colour1)%#$normal '
  RPROMPT1="$colour1($colour2%~$colour1)$normal"
  RPROMPT2="$colour1($colour2%~$colour1)$normal"
}

vim_time_prompt

## run TRAPALRM every $TMOUT seconds
TMOUT=30

TRAPALRM () {
  ## reset-prompt - this will update the prompt
  zle reset-prompt
}
