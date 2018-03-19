#!/usr/bin/env bash

# File from https://discuss.circleci.com/t/circleci-pypi-deploy/11818/2

if [ -z "$CI" ]; then
    echo "Will only continue on CI"
    exit
fi

if [[ $CIRCLE_BRANCH != "master" ]]; then
    echo "Will only continue for master builds"
    exit
fi

# build package and upload to private pypi index
echo "[distutils]" >> ~/.pypirc
echo "index-servers = pypi-private" >> ~/.pypirc
echo "[pypi-private]" >> ~/.pypirc
echo "repository=https://upload.pypi.org/legacy/" >> ~/.pypirc
echo "username=$PYPI_USERNAME" >> ~/.pypirc
echo "password=$PYPI_PASSWORD" >> ~/.pypirc

python setup.py sdist upload -r pypi-private