#!/usr/bin/env bash
#set -e

REGISTRY="https://registry.npmjs.org"

if [ "$1" = "local" ]; then
  REGISTRY="http://localhost:4873"
fi

# build
if [ "$1" = "local" ]; then
  mvn -Dnpm-registry="$REGISTRY" clean generate-sources exec:exec@typedoc exec:exec@npm-publish
else
  mvn -Dnpm-registry="$REGISTRY" exec:exec@npm-publish
fi
