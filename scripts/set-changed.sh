#!/usr/bin/env bash

./scripts/tree-hash.sh
KEY=$1
FILE=".cache/tree-hash/$KEY.json"

cp .cache/tree-hash/state.json "$FILE"
