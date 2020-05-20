# This networkpref.sh file is developed as an shell library, Never run this file alone

# handles colors stuff
source sourcelib/colors.sh

# network vars
INTR="eth0"
LOCALHOST="192.168.0.52"
LOCALPORT="9090"

# get dynamically LOCALHOST
# this is not used, written advanced to v2.0, stay tuned.
dynIP()
{
  status_line="$(ifconfig eth0 | grep " inet ")"
  set -- $status_line
  LOCALHOST="${2}"
}
