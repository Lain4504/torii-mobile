#!/usr/bin/env bash
# Generate Dart protobuf code from proto files (synced from torii-monorepo packages/protocol).
#
# Before generating, sync protos: ./scripts/sync_proto_from_monorepo.sh
#
# Version alignment with NestJS server (torii-monorepo):
#   - Server (packages/protocol): Buf + @bufbuild/protoc-gen-es ^2.10.1 (TypeScript)
#   - Mobile: protoc + protoc-gen-dart. Wire format is identical; we pin protoc_plugin 22.5.0 (protobuf 4.x).
#
# Prerequisites:
#   1. Install protoc: https://grpc.io/docs/protoc-installation/
#   2. dart pub global activate protoc_plugin 22.5.0
#   3. For protos that use buf/validate (import google/protobuf): install libprotobuf-dev or set
#      PROTO_GOOGLE_IMPORT_PATH to a directory containing google/protobuf/*.proto (e.g. /usr/include).
set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
PROTO_DIR="$PROJECT_ROOT/proto"
OUT_DIR="$PROJECT_ROOT/lib/features/meet/data/models/proto"

# Optional: path to google protobuf well-known types (for buf/validate and livekit imports)
if [ -n "$PROTO_GOOGLE_IMPORT_PATH" ]; then
  EXTRA_PROTO_PATH="-I $PROTO_GOOGLE_IMPORT_PATH"
elif [ -d /usr/include ]; then
  EXTRA_PROTO_PATH="-I /usr/include"
else
  EXTRA_PROTO_PATH=""
fi

dart pub global activate protoc_plugin 22.5.0

if [ ! -d "$PROTO_DIR" ]; then
  echo "Proto dir not found: $PROTO_DIR"
  echo "Run ./scripts/sync_proto_from_monorepo.sh first (from torii-mobile root)."
  exit 1
fi

# Find protoc-gen-dart
if command -v protoc-gen-dart &>/dev/null; then
  :
elif [ -x "$HOME/.pub-cache/bin/protoc-gen-dart" ]; then
  export PATH="$HOME/.pub-cache/bin:$PATH"
else
  echo "protoc-gen-dart not found. Run: dart pub global activate protoc_plugin 22.5.0"
  exit 1
fi

# Collect all .proto files (excluding buf.lock etc.)
PROTO_FILES=()
while IFS= read -r -d '' f; do
  PROTO_FILES+=("$f")
done < <(find "$PROTO_DIR" -name '*.proto' -print0 | sort -z)

if [ ${#PROTO_FILES[@]} -eq 0 ]; then
  echo "No .proto files in $PROTO_DIR"
  exit 1
fi

echo "Generating Dart code from ${#PROTO_FILES[@]} proto files -> $OUT_DIR"
# shellcheck disable=SC2086
protoc \
  --proto_path="$PROTO_DIR" \
  $EXTRA_PROTO_PATH \
  --dart_out="$OUT_DIR" \
  "${PROTO_FILES[@]}"

echo "Done. Generated files in $OUT_DIR"
