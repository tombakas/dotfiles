#!/usr/bin/env bash

REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)

if [ -n "$REPO_ROOT" ]; then
  echo "$REPO_ROOT"
else
  echo .
fi
