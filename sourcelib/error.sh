# This error.sh file is developed as an shell library, Never run this file alone

# handles error stuff
source sourcelib/colors.sh

# handles banner error
bannerError()
{
  echo -e "${RED}${NRML}Unable to print banner due to terminal size"
}

# handles dependencies error
req_error()
{
  echo -e "${RED}${NRML}${1} not installed"
  echo -e "${RED}${NRML}exiting the script.."
  echo -e "------------------------------------"
  exit 1
}

# acknowledge no payload status
noPayload()
{
  echo -e "${GREEN}${NRML}No Pivot Payload to clean"
}

# handles payload generation error
errorPayloadGeneration()
{
  echo -e "${RED}${NRML}Error in generation of payload"
  echo -e "${RED}${NRML}exiting the script.."
  echo -e "------------------------------------"
  exit 1
}

# handles apache fail to start/stop error
apacheFailed()
{
  echo -e "${RED}${NRML}Failed to start/stop apache2"
  echo -e "${RED}${NRML}exiting the script.."
  echo -e "------------------------------------"
  exit 1
}

# handles msfdb fail to start/stop error
# most commonly MSFDB uses POSTGRESQL as the database
msfdbFailed()
{
  echo -e "${RED}${NRML}Failed to start/stop msfdb"
  echo -e "${RED}${NRML}exiting the script.."
  echo -e "------------------------------------"
  exit 1
}

# handles resource script generation error
errorResourceScriptHandlerGeneration()
{
  echo -e "${RED}${NRML}Error generating ${1} resource file"
  echo -e "${RED}${NRML}exiting the script.."
  echo -e "------------------------------------"
  exit 1
}

#handles arg error
errorArgCheck()
{
  echo -e "${RED}${NRML}Error in checkarg arguments"
  echo -e "${RED}${NRML}exiting the script.."
  echo -e "------------------------------------"
  exit 1
}

# handles generic error
# if u need to generate a generic error make a call to this function by passing message as arg.
reportError()
{
  checkarg 1 "$@"
  echo -e "${RED}${NRML}Error reported"
  echo -e "${RED}${NRML}Message: ${1}"
  echo -e "${RED}${NRML}exiting the script.."
  echo -e "------------------------------------"
  exit 1
}
