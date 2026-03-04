#!/usr/bin/env bash
set -euo pipefail

# Defaults
: "${PUBLIC_IP:=}"
: "${SIGNAL_PORT:=49100}"
: "${STREAM_PORT:=47998}"
: "${WIDTH:=2560}"
: "${HEIGHT:=1440}"

cd /isaac-sim

args=(
  "--/exts/omni.kit.livestream.app/primaryStream/signalPort=${SIGNAL_PORT}"
  "--/exts/omni.kit.livestream.app/primaryStream/streamPort=${STREAM_PORT}"
  "--/exts/omni.kit.livestream.app/primaryStream/width=${WIDTH}"
  "--/exts/omni.kit.livestream.app/primaryStream/height=${HEIGHT}"
)

if [[ -n "${PUBLIC_IP}" ]]; then
  args+=("--/exts/omni.kit.livestream.app/primaryStream/publicIp=${PUBLIC_IP}")
fi

exec ./runheadless.sh "${args[@]}"