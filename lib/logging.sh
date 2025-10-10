NO_COLOR="\033[0m"
INFO_COLOR="\033[1;32m"
ERR_COLOR="\033[0;31m"

function log_info {
  echo -e "${INFO_COLOR}$1${NO_COLOR}"
}

function log_error {
  echo -e "${ERR_COLOR}$1${NO_COLOR}"
}
