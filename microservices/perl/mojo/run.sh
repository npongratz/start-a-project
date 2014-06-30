#!/bin/bash

# vim: filetype=sh:tabstop=2:shiftwidth=2:expandtab

readonly PROGNAME=$(basename $0)
readonly PROGDIR="$( cd "$(dirname "$0")" ; pwd -P )"
readonly CARTON=`which carton`

## These should be command line options:
MY_APP_ROOT=${APP_ROOT}
MY_APP_FILE=${APP_FILE}


usage()
{
  echo -e "\033[33mHere's how to run this application in Docker:"
  echo ""
  echo -e "\033[33m./run.sh"
  echo -e "\t\033[33m-h --help"
  echo -e "\t\033[33m--dir=${MY_APP_ROOT} (i.e. application root directory)"
  echo -e "\t\033[33m--file=${MY_APP_FILE} (i.e. main application file found under ${MY_APP_ROOT}/app/...)"
  echo -e "\033[0m"
}


parse_args()
{
  while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
      -h | --help)
        usage
        exit
        ;;
      --dir)
        MY_APP_ROOT=$VALUE
        ;;
      --file)
        MY_APP_FILE=$VALUE
        ;;
      *)
        echo -e "\033[31mERROR: unknown parameter \"$PARAM\""
        echo -e "\e[0m"
        usage
        exit 1
        ;;
    esac
    shift
  done
}


valid_app_root()
{
  if [ ! -d "${MY_APP_ROOT}" ]
  then
	  echo "application root directory (i.e. ${MY_APP_ROOT}) does not exist.  Fail!!!"
    usage
	  exit 1
  fi
}


valid_app_file()
{
  if [ ! -f "${MY_APP_ROOT}/app/${MY_APP_FILE}" ]
  then
	  echo "main application file (i.e. ${MY_APP_ROOT}/app/${MY_APP_FILE}) does not exist.  Fail!!!"
    usage
	  exit 1
  fi
}


main()
{

  parse_args
  valid_app_root
  valid_app_file

  ${CARTON} exec morbo ${MY_APP_ROOT}/app/${MY_APP_FILE}
}

parse_args "$@"
main
