#!/bin/bash

git rebase --interactive --preserve-merges 2440334 --exec ./renaming.sh

git filter-branch -f --env-filter 'GIT_COMMITTER_DATE=$GIT_AUTHOR_DATE; export GIT_COMMITTER_DATE'

