#!/usr/bin/env bash
# Check required environment variables are set.
set -euo pipefail

missing=0
if [ -z "${PG_CONNECTION_STRING:-}" ]; then echo "MISSING: PG_CONNECTION_STRING"; missing=$((missing+1)); fi
if [ -z "${ORG_ID:-}" ]; then echo "MISSING: ORG_ID"; missing=$((missing+1)); fi
if [ -z "${AGENT_ID:-}" ]; then echo "MISSING: AGENT_ID"; missing=$((missing+1)); fi
if [ -z "${RUN_ID:-}" ]; then echo "MISSING: RUN_ID"; missing=$((missing+1)); fi
if [ -z "${GITHUB_API_BASE:-}" ]; then echo "MISSING: GITHUB_API_BASE"; missing=$((missing+1)); fi
if [ -z "${GITHUB_TOKEN:-}" ]; then echo "MISSING: GITHUB_TOKEN"; missing=$((missing+1)); fi
if [ -z "${GITHUB_OWNER:-}" ]; then echo "MISSING: GITHUB_OWNER"; missing=$((missing+1)); fi
if [ -z "${AGENT_REPO_NAME:-}" ]; then echo "MISSING: AGENT_REPO_NAME"; missing=$((missing+1)); fi

if [ $missing -gt 0 ]; then
    echo "$missing required env var(s) missing"
    exit 1
fi
echo "OK: all required env vars set"
