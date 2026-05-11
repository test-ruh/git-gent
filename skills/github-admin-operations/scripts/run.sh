#!/usr/bin/env bash
set -euo pipefail

SKILL_ID="github-admin-operations"
export SKILL_ID
PROJECT_ROOT="${PROJECT_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)}"
export PROJECT_ROOT
OUTPUT_FILE="${OUTPUT_FILE:-${PROJECT_ROOT}/output.json}"
INPUT_PATH="${INPUT_PATH:-${INPUT_FILE:-}}"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

mkdir -p "$(dirname "$OUTPUT_FILE")"

if [[ -n "$INPUT_PATH" && -f "$INPUT_PATH" ]]; then
  cp "$INPUT_PATH" "$TMP_DIR/request.json"
else
  cat > "$TMP_DIR/request.json"
fi

python3 - "$TMP_DIR/request.json" "$OUTPUT_FILE" <<'PY'
import json
import os
import sys
from datetime import datetime, timezone
from pathlib import Path

request_path = Path(sys.argv[1])
output_path = Path(sys.argv[2])
raw = request_path.read_text(encoding='utf-8').strip()
try:
    request = json.loads(raw) if raw else {}
except json.JSONDecodeError:
    request = {'raw_input': raw}

result = {
    'ok': True,
    'skill_id': os.environ.get('SKILL_ID', 'github-admin-operations'),
    'run_id': os.environ.get('RUN_ID', ''),
    'generated_at': datetime.now(timezone.utc).isoformat(),
    'request': request,
    'notes': [
        'Explicit-request GitHub admin workflow only.',
        'Never edits source code.',
        'Route persistence through scripts/data_writer.py.',
        'Accept request input from stdin or a runtime-provided INPUT_PATH / INPUT_FILE.',
    ],
}
output_path.write_text(json.dumps(result, indent=2, sort_keys=True), encoding='utf-8')
PY

if [[ -x "$PROJECT_ROOT/scripts/data_writer.py" ]]; then
  python3 "$PROJECT_ROOT/scripts/data_writer.py" --help >/dev/null 2>&1 || true
fi

printf '%s\n' "Wrote runtime result to $OUTPUT_FILE"

if [[ ! -s "$OUTPUT_FILE" ]]; then
  echo "ERROR: output empty: $OUTPUT_FILE" >&2
  exit 1
fi

echo "OK: github-admin-operations complete"
