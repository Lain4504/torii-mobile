#!/usr/bin/env bash
# Generate Dart protobuf code from proto files (synced from torii-monorepo packages/protocol).
#
# Version alignment with NestJS server (torii-monorepo):
#   - Server (packages/protocol): Buf + @bufbuild/protoc-gen-es ^2.10.1 (TypeScript), @bufbuild/protobuf ^2.10.1
#   - Mobile: protoc + protoc-gen-dart. Wire format is identical; we pin the Dart plugin to a version
#     compatible with this app's transitive protobuf (4.x from livekit_client): protoc_plugin 22.5.0.
#   - Generated files will have // @dart = 3.x (plugin 22+ requires Dart 3.3+); server uses modern TS 2.10.x.
#
# Prerequisites:
#   1. Install protoc: https://grpc.io/docs/protoc-installation/
#   2. Install Dart plugin (pinned to match protobuf 4.x): dart pub global activate protoc_plugin 22.5.0
set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
PROTO_DIR="$PROJECT_ROOT/proto"
OUT_DIR="$PROJECT_ROOT/lib/features/meet/data/models/proto"

# Use protoc_plugin 22.5.0 (compatible with protobuf 4.x; same "generation era" as server's Buf 2.10.x)
dart pub global activate protoc_plugin 22.5.0

if [ ! -d "$PROTO_DIR" ]; then
  echo "Proto dir not found: $PROTO_DIR"
  exit 1
fi

# Find protoc-gen-dart (from dart pub global activate protoc_plugin)
if command -v protoc-gen-dart &>/dev/null; then
  PROTOC_GEN_DART="protoc-gen-dart"
else
  CACHE_BIN="$HOME/.pub-cache/bin"
  if [ -x "$CACHE_BIN/protoc-gen-dart" ]; then
    export PATH="$CACHE_BIN:$PATH"
    PROTOC_GEN_DART="protoc-gen-dart"
  else
    echo "protoc-gen-dart not found. Run: dart pub global activate protoc_plugin 22.5.0"
    exit 1
  fi
fi

echo "Generating Dart code from $PROTO_DIR -> $OUT_DIR"
protoc \
  --proto_path="$PROTO_DIR" \
  --dart_out="$OUT_DIR" \
  "$PROTO_DIR/wajlc_datamessage.proto" \
  "$PROTO_DIR/wajlc_nats_msg.proto" \
  "$PROTO_DIR/wajlc_common_api.proto"

echo "Done. Generated files in $OUT_DIR"
