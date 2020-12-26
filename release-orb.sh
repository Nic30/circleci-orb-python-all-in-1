#!/bin/bash
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
circleci orb publish orb.yml "Nic30/circleci-python-install-test-coverage-pypi@${tag:1}" || { echo 'Orb release failed.' ; exit 1; }
