#!/bin/bash

# vim: filetype=sh:tabstop=2:shiftwidth=2:expandtab

readonly PROGNAME=$(basename $0)
readonly PROGDIR="$( cd "$(dirname "$0")" ; pwd -P )"
readonly VIRTUALENV=`which virtualenv`
readonly UWSGI=`which uwsgi`

## These should be command line options:
MY_APP_ROOT=${APP_ROOT}
MY_APP_PORT=${APP_PORT}
MY_APP_FILE=${APP_FILE}
MY_APP_CALLABLE=${APP_CALLABLE}


usage()
{
  echo -e "\033[33mHere's how to run this application in Docker:"
  echo ""
  echo -e "\033[33m./run.sh"
  echo -e "\t\033[33m-h --help"
  echo -e "\t\033[33m--dir=${MY_APP_ROOT} (i.e. application root directory)"
  echo -e "\t\033[33m--port=${MY_APP_PORT} (i.e. app server http port)"
  echo -e "\t\033[33m--file=${MY_APP_FILE} (i.e. main application file found under ${MY_APP_ROOT}/app/...)"
  echo -e "\t\033[33m--callable=${MY_APP_CALLABLE} (i.e. the WSGI callable inside of '${MY_APP_FILE}')"
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
      --port)
        MY_APP_PORT=$VALUE
        ;;
      --file)
        MY_APP_FILE=$VALUE
        ;;
      --callable)
        MY_APP_CALLABLE=$VALUE
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


#if [ ! -d "${MY_APP_ROOT}/env" ]
#then
#	echo "creating a virtualenv environment"
#	cd ${MY_APP_ROOT}; $VIRTUALENV env
#	${MY_APP_ROOT}/env/bin/pip install -r app/requirements.txt
#fi

#if [ ! -f "${MY_APP_ROOT}/env/bin/uwsgi" ]
#then
#	echo "no virtualenv environment was created.  Fail!!!"
#	exit 1
#fi

main()
{

  parse_args
  echo "app roo: ${MY_APP_ROOT}"

  valid_app_root
  valid_app_file

  ${UWSGI} --http :${MY_APP_PORT} --wsgi-file ${MY_APP_ROOT}/app/${MY_APP_FILE} --callable ${MY_APP_CALLABLE} --touch-reload ${MY_APP_ROOT}/reload
}

parse_args "$@"
main
