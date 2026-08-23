#!/usr/bin/env bash
set -euo pipefail

# naming-rules.md is deliberately duplicated: both skills need it, and each skill
# folder has to be self-contained so it can be zipped and uploaded to claude.ai
# on its own. This check fails if the two copies have drifted.

cd "$(dirname "${BASH_SOURCE[0]}")/.."

A="skills/pm-project-brief/references/naming-rules.md"
B="skills/pm-project-init/references/naming-rules.md"

if diff -u "$A" "$B" > /dev/null; then
  echo "✓ naming-rules.md copies are identical"
else
  echo "✗ naming-rules.md copies have drifted:" >&2
  diff -u "$A" "$B" >&2 || true
  echo >&2
  echo "Edit one, then copy it over the other:" >&2
  echo "  cp $A $B" >&2
  exit 1
fi
