#!/bin/bash

msg=$(git log --format=%B -n 1 HEAD)

if [ "${msg:0:3}" == "MCO" ]
then
  date=$(git log --format=%ad -n 1 HEAD)

  git commit --amend --message="MCOAG${msg:3}" --date="$date"
fi
