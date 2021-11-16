#!/usr/bin/env bash

function copy_coverage_to_root() {
  PACKAGE_PATH=$1
  PACKAGE_NAME=$(basename "$PACKAGE_PATH")
  if [[ "$PACKAGE_NAME" != "$ROOT_NAME" ]]; then
    cp "$PACKAGE_PATH/coverage/coverage-final.json" "$ROOT_PATH/.cache/.nyc_output/$PACKAGE_NAME.json"
  fi

}

ROOT_PATH=$(pwd)
ROOT_NAME=$(basename "$ROOT_PATH")

mapfile -t PACKAGES < <(pnpm recursive exec pwd)

mkdir -p "$ROOT_PATH/.cache/.nyc_output"

for PACKAGE in "${PACKAGES[@]}"; do
  copy_coverage_to_root "$PACKAGE"
done

pnpm nyc report \
  --reporter=json \
  --reporter=text \
  --reporter=lcov \
  --reporter=clover \
  --reporter=cobertura \
  --report-dir=coverage \
  --temp-dir=.cache/.nyc_output \
  --cwd .
