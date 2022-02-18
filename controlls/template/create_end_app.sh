#!/bin/bash

while [ $# -gt 0 ]; do
  case "$1" in
    --appName=*)
      appName="${1#*=}"
      ;;
    --eject=*)
      eject="${1#*=}"
      ;;
    --appDirectory=*)
      eject="${1#*=}"
      ;;
    --returnDirectory=*)
      eject="${1#*=}"
      ;;
    *)
      printf "***************************\n"
      printf "* Error: Invalid argument.*\n"
      printf "***************************\n"
      exit 1
  esac
  shift
done
if [[ -z "$appName" || -z "$appDirectory" || -z "$returnDirectory" ]]
then
  echo "we need appName and appDirectory and returnDirectory to create app"
fi

# cd "$appDirectory"
echo "creating react app $appName in $appDirectory directory"
yarn create-react-app "$appName"
mkdir $appName

mv -i $appName $appDirectory

if [ "$eject" = "true" ]
then
  cd "$appName"
  yarn run eject
  echo "all done returning to base"
  cd "$returnDirectory"
  echo "returned to $returnDirectory successfully "
fi

echo "done"

printf "hi appname $appName $eject $appDirectory $returnDirectory"