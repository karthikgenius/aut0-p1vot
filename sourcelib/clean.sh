# This clean.sh file is developed as an shell library, Never run this file alone

#handles metasploit stuff
source sourcelib/metasploit.sh

#handles colors stuff
source sourcelib/colors.sh

#handles all apache2 stuff
source sourcelib/serverweb.sh

# delete_payload deletes the PAYLOADFILE in SERVERDIRECTORY
delete_payload()
{
	if [[ -e ${SERVERDIRECTORY}${PAYLOADFILE} ]];
	then
		rm ${SERVERDIRECTORY}${PAYLOADFILE} &> /dev/null || reportError "Error deleting PAYLOADFILE"
		return 0
	else
		return 1
	fi
}
