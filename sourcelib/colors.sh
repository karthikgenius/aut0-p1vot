# This color.sh file is developed as an shell library, Never run this file alone


#color vars
RED="\e[91m[-]"
GREEN="\e[32m[+]"
YELLOW="\e[33m[*]"
NRML="\e[39m"
CYAN="\e[96m"
BOLD="\e[1m"
BLUE="\e[94m"
CYANLIGHT="\e[96m"
MAGENTA="\e[95m"
GREENRAW="\e[32m"
INVERT="\e[7m"

#terminal size vars
COLS="$(tput cols)"
LINES="$(tput lines)"


# prints banner and author
bannerPrinter()
{
  if [ "${COLS}" -gt 89 ] && [ "${LINES}" -gt 16 ];
  then
    echo
    printf "${CYAN}                       █████       █████              ████                        █████
                      ░░███      ███░░░███           ░░███                       ░░███
  ██████   █████ ████ ███████   ███   ░░███ ████████  ░███  █████ █████  ██████  ███████
 ░░░░░███ ░░███ ░███ ░░░███░   ░███    ░███░░███░░███ ░███ ░░███ ░░███  ███░░███░░░███░
  ███████  ░███ ░███   ░███    ░███    ░███ ░███ ░███ ░███  ░███  ░███ ░███ ░███  ░███
 ███░░███  ░███ ░███   ░███ ███░░███   ███  ░███ ░███ ░███  ░░███ ███  ░███ ░███  ░███ ███
░░████████ ░░████████  ░░█████  ░░░█████░   ░███████  █████  ░░█████   ░░██████   ░░█████
 ░░░░░░░░   ░░░░░░░░    ░░░░░     ░░░░░░    ░███░░░  ░░░░░    ░░░░░     ░░░░░░     ░░░░░
                                            ░███
                                            █████
                                           ░░░░░
                                        ${NRML}                                    v1.0
                                ./~
                         (=#####{>======${CYANLIGHT}Made by k4r7h1k0x00\e[91m============-${NRML}
                                \`\~
                                        ${MAGENTA}techiekarthik.in
    ${NRML}"
    sleep 3s
    echo
  else
    return 1
  fi
}
