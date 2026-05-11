---
name: github-admin-operations
version: 1.0.0
description: "Perform GitHub repository and pull-request administration for explicit requests only, including repo creation, metadata updates, PR drafting, labels, assignees, review requests, comments, and merges with approval gating."
user-invocable: true
metadata:
  openclaw:
    always: true
    requires:
      bins: [bash, curl, jq, date, python3]
      env: [PG_CONNECTION_STRING, ORG_ID, AGENT_ID, RUN_ID, GITHUB_API_BASE, GITHUB_TOKEN]
    primaryEnv: GITHUB_TOKEN
---
# github-admin-operations

## I/O Contract

- **Input:** `stdin`
- **Output:** `OUTPUT_FILE`

## Execute

```bash
bash {baseDir}/scripts/run.sh
```
