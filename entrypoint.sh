#!/bin/sh
NUMBER=$(curl -L -s \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${GITHUB_TOKEN}"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/${GITHUB_REPOSITORY}/milestones?state=open | jq "map(select(.title == \"${INPUT_TITLE}\").number)[]")
  
if [ $NUMBER ]; then
	curl -L -s \
  		-X PATCH \
  		-H "Accept: application/vnd.github+json" \
  		-H "Authorization: Bearer ${GITHUB_TOKEN}"\
  		-H "X-GitHub-Api-Version: 2022-11-28" \
  		https://api.github.com/repos/${GITHUB_REPOSITORY}/milestones/$NUMBER \
  		-d '{"state":"closed"}'
  
  echo "number=$NUMBER" >> $GITHUB_OUTPUT
else 
	echo "number=0" >> $GITHUB_OUTPUT
fi