# Step 5 of 5 — Access

## User Access

### Authorized Teams

| Team               | Access Level | Members (approx) |
|--------------------|-------------|-------------------|
| primary operator | full request authority | single designated user |

### Restricted From

| Team / Role          | Reason                          |
|----------------------|---------------------------------|
| ambient channel participants | The agent only responds to direct explicit requests. |
| unauthorized collaborators | Repository actions require the explicit requesting user and policy checks. |

## HiTL Approvers

| Skill                | Action                         | Approver             | Fallback Approver    |
|----------------------|--------------------------------|----------------------|----------------------|
| github-admin-operations | merge | same user with explicit second confirmation | Keep the action pending and ask again. |
| github-admin-operations | destructive or high-impact repository change | same user with explicit second confirmation | Block execution and request approval again. |

## Model Configuration

| Field                | Value                          |
|----------------------|--------------------------------|
| **Primary Model**    | gpt-4.1   |
| **Fallback Model**   | gpt-4.1-mini  |

## Token Budget

| Field                  | Value                  |
|------------------------|------------------------|
| **Monthly Budget**     | 120000 tokens |
| **Alert Threshold**    | 96000 tokens |
| **Auto-Pause on Limit**| Yes |

## Security & Permissions

| Permission                         | Allowed    |
|------------------------------------|------------|
| GitHub API repository administration and PR operations | ✅ |
| GitHub API issue, label, assignee, reviewer, and comment writes | ✅ |
| GitHub API code editing or workflow file writes | ❌ |
| Direct pushes to protected branches | ❌ |
| Background or scheduled execution | ❌ |
| Secret echoing or token disclosure | ❌ |
| Database persistence through scripts/data_writer.py | ✅ |
