#!/bin/bash
# Attention: the relese should be uploaded by circleci and usage of this script is not required
command -v circleci >/dev/null 2>&1 || { echo >&2 "I require circleci but it's not installed.  Aborting."; exit 1; }

commit=$(git log -n1 --pretty='%h')
tag=$(git describe --exact-match --tags "$commit")

retVal=$?
echo "retVal = $retVal"
if [ $retVal -ne 0 ]; then
    echo "You need to checkout a valid tag for this to work."
    exit $retVal
fi

echo "Release: $commit - $tag"

echo "Validating..."
make orb-validate || { echo 'Orb failed to validate.' ; exit 1; }

echo "Releasing..."
# circleci orb create "nic30/python-all-in-1"
# circleci orb publish orb.yml "nic30/python-all-in-1@dev:alpha"
circleci orb publish orb.yml "nic30/python-all-in-1@${tag:1}" || { echo 'Orb release failed.' ; exit 1; }

# to get latest release use circleci orb info nic30/python-all-in-1