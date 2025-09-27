parse_git_branch() {
  local ref
  ref=$(git symbolic-ref --quiet HEAD 2>/dev/null) || return
  printf '(%s)' "${ref##refs/heads/}"
}
PROMPT_COMMAND='__GB="$(parse_git_branch)"'
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w${__GB}\$ '


export PATH="${HOME}/bin:${PATH}"
