#!/usr/bin/env bash

REGION=0
TARGET_DIR=$HOME
DATETIME=$(date "+%Y_%h_%d_%H:%M:%S")
FILENAME="screenshot_${DATETIME}.png"

function usage ()
{
    echo "Usage :  $0 [options] [--]

    Options:
    -h|help       Display this message
    -r|region     Take screenshot of region"

}    # ----------  end of function usage  ----------

#-----------------------------------------------------------------------
#  Handle command line arguments
#-----------------------------------------------------------------------

while getopts ":hr" opt
do
  case $opt in

    h)  usage; exit 0;;
    r)  REGION=1;;

    * )  echo -e "\n  Option does not exist : $OPTARG\n"
          usage; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))

if command -v import &>/dev/null; then
    TARGET=$TARGET_DIR/$FILENAME
    if [ $REGION -eq 1 ]; then
        echo "Select region to capture"
        import $TARGET_DIR/$FILENAME
        echo "Saving region to ${TARGET}"
    else
        echo "Saving entire screen to ${TARGET}"
        import -window root $TARGET_DIR/$FILENAME
    fi
fi
