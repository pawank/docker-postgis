#!/bin/sh

export PGPASSWORD=docker

#Execute below in a separate terminal
#boot2docker ssh -L 25432:localhost:5432

#Only for mac osx postgres client
/Library/PostgreSQL/9.3/bin/psql -h $(boot2docker ip) -U docker -p 25432 gis -l
