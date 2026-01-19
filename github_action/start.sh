#!/bin/bash
set -e

# --- Environment variable checks ---
if [ -z "$GH_RUNNER_TOKEN" ]; then
  echo "❌ Error: GH_RUNNER_TOKEN not set!"
  exit 1
fi

if [ -z "$GH_RUNNER_URL" ]; then
  echo "❌ Error: GH_RUNNER_URL not set! (e.g. https://github.com/Simba-Avionic)"
  exit 1
fi

if [ -z "$GH_RUNNER_NAME" ]; then
  echo "ℹ️ GH_RUNNER_NAME not set, using hostname..."
  GH_RUNNER_NAME=$(hostname)
fi

if [ -z "$RUNNER_LABELS" ]; then
  echo "ℹ️ RUNNER_LABELS not set, using default: self-hosted"
  RUNNER_LABELS="self-hosted"
fi

./config.sh remove --token "${GH_RUNNER_TOKEN}" || true

echo "🏗️ Configuring GitHub Actions Runner..."
./config.sh \
  --url "${GH_RUNNER_URL}" \
  --token "${GH_RUNNER_TOKEN}" \
  --name "${GH_RUNNER_NAME}" \
  --labels "${RUNNER_LABELS}" \
  --unattended \
  --replace

echo "✅ Configuration done — starting runner..."

exec ./run.sh