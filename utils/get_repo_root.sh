#!/usr/bin/env bash

# Escape .git subdirectory if inside it
while [[ "$(pwd)" =~ .git ]]; do
  cd ..
done

REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
if [ -n "$REPO_ROOT" ]; then
  echo "$REPO_ROOT"
else
  echo .
fi
