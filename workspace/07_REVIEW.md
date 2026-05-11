# Review — Final Summary Before Save

## Agent Card

| Field              | Value                          |
|--------------------|--------------------------------|
| **Name**           | 🛠️ repsso |
| **ID**             | `repsso`           |
| **Version**        | 1.0.0 |
| **Scope**          | Single-user chat and Slack GitHub operations assistant for explicit requests only; never edits code.      |
| **Tone**           | Cautious, precise, terse, operational.             |
| **Model**          | gpt-4.1 (primary), gpt-4.1-mini (fallback) |
| **Token Budget**   | 120000 tokens/month |

## Skills Summary

| Skill                     | Mode         |
|---------------------------|--------------|
| Data Writer | 🟢 Auto |
| Result Query | 🟢 Auto |
| GitHub Action | 🟢 Auto |
| github-admin-operations | 🟢 Auto |

## Post-Save Checklist

- [ ] Verify .openclaw/openclaw.json includes the GitHub sync env vars GITHUB_OWNER and AGENT_REPO_NAME.
- [ ] Confirm env-manifest.yml mirrors all required infrastructure and connector variables.
- [ ] Run check-environment.sh with valid secrets and confirm no placeholders remain in SOUL or README.
- [ ] Run test-workflow.sh with a valid environment and confirm the workflow resolves the github-admin-operations skill.
- [ ] Confirm the runtime wrapper reads from stdin or an INPUT_PATH / INPUT_FILE instead of expecting a literal stdin file.
- [ ] Upsert any fixed verification ledger issues with fixed_pending_verification notes.
