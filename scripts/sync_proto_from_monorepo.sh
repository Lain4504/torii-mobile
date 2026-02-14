#!/usr/bin/env bash
# Sync proto files from torii-monorepo/packages/protocol/proto into torii-mobile/proto
# so we can generate Dart code from the same source as the server.
#
# Run from torii-mobile root, or set TORII_MONOREPO_PROTO_DIR.
# Example: ./scripts/sync_proto_from_monorepo.sh
set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
PROTO_DEST="$PROJECT_ROOT/proto"

# Monorepo protocol proto dir (sibling repo by default)
if [ -n "$TORII_MONOREPO_PROTO_DIR" ]; then
  SRC="$TORII_MONOREPO_PROTO_DIR"
else
  for REL in "../torii-monorepo" "../../torii-monorepo"; do
    CANDIDATE="$(cd "$PROJECT_ROOT/$REL" 2>/dev/null && pwd)"
    if [ -d "$CANDIDATE/packages/protocol/proto" ]; then
      SRC="$CANDIDATE/packages/protocol/proto"
      break
    fi
  done
  if [ -z "$SRC" ] || [ ! -d "$SRC" ]; then
    echo "torii-monorepo not found. Set TORII_MONOREPO_PROTO_DIR to the protocol proto directory."
    echo "Example: TORII_MONOREPO_PROTO_DIR=/path/to/torii-monorepo/packages/protocol/proto $0"
    exit 1
  fi
fi

echo "Syncing proto: $SRC -> $PROTO_DEST"
mkdir -p "$PROTO_DEST"

# Copy all .proto and dirs (buf/, logger/); skip buf.lock and BUILD.bazel
# We exclude google/ because standard protos are local to torii-mobile but not always in monorepo
rsync -a --delete \
  --include='*/' \
  --include='*.proto' \
  --exclude='buf.lock' \
  --exclude='BUILD.bazel' \
  --exclude='*.md' \
  --exclude='google/' \
  "$SRC/" "$PROTO_DEST/"

echo "Done. Run ./scripts/generate_proto.sh to generate Dart code."
