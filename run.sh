#!/bin/sh


echo -n "USAGE: ./run.sh PASSWORD 1 (for server)/0 (for client) DBNAME"

#Execute below in a separate terminal
#boot2docker ssh -L 25432:localhost:5432

HOST=`echo $DOCKER_HOST | cut -d: -f2 | cut -c3-`

if [ $# -eq 0 ]
  then
        echo -n "USAGE: ./run.sh PASSWORD 1 (for server)/0 (for client) DBNAME"
        exit
fi
export PGPASSWORD=$1

SERVER=$2
DBNAME=$3

if [[ ${SERVER} == "1" ]]; then
    docker run --name "postgis" -p 25432:5432 -d -t pawank/postgis
fi
if [[ ${SERVER} == "0" ]]; then
  #Only for mac osx postgres client
  /Library/PostgreSQL/9.3/bin/psql -h $HOST -U docker -p 25432 $DBNAME -l
fi


