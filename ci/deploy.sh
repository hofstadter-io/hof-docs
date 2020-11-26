#!/usr/bin/env bash
set -euo pipefail

PROJECT=hof-io--develop
TAG=$(git rev-parse --short HEAD | tr -d "\n")

./ci/highlight.sh

hugo --baseURL https://docs.hofstadter.io/ -d dist

docker build -t us.gcr.io/$PROJECT/docs.hofstadter.io:manual .
docker push us.gcr.io/$PROJECT/docs.hofstadter.io:manual

rm -rf dist

kubectl get pods -n websites

