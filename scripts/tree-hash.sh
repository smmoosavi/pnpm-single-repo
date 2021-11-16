#!/usr/bin/env bash

mkdir -p .cache/tree-hash

CURRENT_TREE=$(git write-tree)
trap 'git read-tree "$CURRENT_TREE"' EXIT
git add --all

GIT_ROOT=$(git rev-parse --show-toplevel)

mapfile -t PACKAGES < <(pnpm recursive exec pwd)

JO_ARGS=("-p")
for PACKAGE in "${PACKAGES[@]}"; do
  PREFIX=$(realpath --relative-to="$GIT_ROOT" "$PACKAGE")
  if [[ "$PREFIX" == "." ]]; then
    continue
  fi
  PACKAGE_HASH=$(git write-tree --prefix="$PREFIX")
  JO_ARGS+=("$PREFIX=$PACKAGE_HASH")
done

jo "${JO_ARGS[@]}" > .cache/tree-hash/state.json
