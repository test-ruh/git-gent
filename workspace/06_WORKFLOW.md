# Workflow — End-to-End Process Flow

Executed by the [Lobster runtime](https://github.com/openclaw/lobster) via `lobster run workflows/main.yaml`.
Steps run **sequentially** in the order shown below.

## Workflow Steps

1. **provision-schema** → `run: python3 scripts/data_writer.py provision` (timeout_ms=30000)
2. **github-admin-operations** → skill `github-admin-operations` (timeout_ms=600000, retry=0)
3. **deliver** → `run: message` (timeout_ms=30000)

## Diagram

```
provision-schema → github-admin-operations → deliver
```
