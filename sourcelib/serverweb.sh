# This serverweb.sh file is developed as an shell library, Never run this file alone

# handles args checking stuff
source sourcelib/argcheck.sh

# handles colors stuff
source sourcelib/colors.sh

# Server vars
APACHESTATUS=""
SERVERDIRECTORY="/var/www/html/"

# checks apache2 installation
checkApache()
{
	which apache2 &> /dev/null || return 1
}


# toggles apache2 server on/off
apacheServer()
{
	checkarg 1 "$@"
	if [[ ${1} = "on" ]];
	then
		systemctl start apache2 &> /dev/null
		APACHESTATUS="ON"
		return 0
	elif [[ ${1} = "off" ]];
	then
		systemctl stop apache2 &> /dev/null
		APACHESTATUS="OFF"
		return 0
	else
		return 1
	fi
}
