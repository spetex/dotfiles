autoload -Uz vcs_info
autoload -U colors && colors
setopt promptsubst

zstyle ':vcs_info:*' formats '%b'

precmd () {
  vcs_info

  CHANGED=$(command git status --porcelain 2> /dev/null | tail -n1)
  STAGED=$(command git status --porcelain 2> /dev/null | grep "^A" | tail -n1)

  if [[ -n $CHANGED ]]; then
    if [[ -n $STAGED ]]; then
      local git_branch='%F{green}$vcs_info_msg_0_'
    else
      local git_branch='%F{red}$vcs_info_msg_0_'
    fi
  else
    local git_branch='%F{yellow}$vcs_info_msg_0_'
  fi

  RPROMPT="${git_branch}"
  PROMPT="%F{blue}%c "
}
