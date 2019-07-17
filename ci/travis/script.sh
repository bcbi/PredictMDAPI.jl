#!/bin/bash

set -ev

export NUMBER_OF_COMMITS=$(git rev-list --count $TRAVIS_COMMIT_RANGE)

echo $NUMBER_OF_COMMITS

if [ "$NUMBER_OF_COMMITS" -eq "1" ]; then
echo "it is equal to one";
else
echo "it is NOT equal to one";
fi
