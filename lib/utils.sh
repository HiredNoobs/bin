# Gets the latest tag for a given github repo
function get_latest_release {
  curl -fsSL https://api.github.com/repos/"$1"/releases/latest | grep '"tag_name":' | cut -d'"' -f4
}

# Clones if not already cloned or pulls updates if exists
function get_latest_git {
  local repo target
  repo=$1
  target=$2

  if [[ -d "$target/.git" ]]; then
    git -C $target pull
  else
    git clone $repo $target
  fi
}
