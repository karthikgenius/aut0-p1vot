# This argcheck.sh file is developed as an shell library, Never run this file alone

#handles error stuff
source sourcelib/error.sh

# checkarg checks the number of args are given ?
checkarg()
{
  if [[ "${#}" -ne 2 ]];
  then
    errorArgCheck
  else
    COUNT=${1}
    shift 1
    if [[ "${#}" -ne "${COUNT}" ]];
    then
      return 1
    fi
  fi
}
