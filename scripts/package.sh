#!/usr/bin/env bash
set -euo pipefail

# Build one zip per skill for upload to claude.ai (Settings → Capabilities →
# Skills). Each zip contains the skill folder with SKILL.md at its root, plus
# references/ and examples/.
#
# Claude Code does not need this — it installs the whole repo as a plugin.

cd "$(dirname "${BASH_SOURCE[0]}")/.."

./scripts/check-shared.sh

rm -rf dist
mkdir -p dist

for skill in skills/*/; do
  name="$(basename "$skill")"
  ( cd skills && zip -qr "../dist/$name.zip" "$name" -x '.DS_Store' -x '*/.DS_Store' )
  echo "✓ dist/$name.zip"
done

echo
echo "Upload each zip at claude.ai → Settings → Capabilities → Skills."
echo "ClickUp is separate: add https://mcp.clickup.com/mcp as a custom Connector."
