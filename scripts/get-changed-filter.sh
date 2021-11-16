#!/usr/bin/env bash

./scripts/tree-hash.sh

KEY=$1



FILE=".cache/tree-hash/$KEY.json"

FILTERS=()

if [ -f "$FILE" ]; then
  ENTRIES=$(jq -r 'to_entries[] | "\(.key)=\(.value)"' .cache/tree-hash/state.json)

  for ENTRY in $ENTRIES; do
    KEY=$(echo "$ENTRY" | cut -d'=' -f1)
    VALUE=$(echo "$ENTRY" | cut -d'=' -f2)
    PREVIOUS=$(jq -r ".[\"$KEY\"]" "$FILE")
    if [ "$VALUE" != "$PREVIOUS" ]; then
      FILTERS+=("--filter ...{$KEY}")
    fi
  done

  if [ ${#FILTERS[@]} -eq 0 ]; then
    FILTERS+=("--filter \!{.}")
  fi
  echo "${FILTERS[@]}"
fi
