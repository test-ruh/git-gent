# Step 4 of 5 — Triggers

## Active Triggers

### T001 — Explicit one-to-one chat request for GitHub administration.

| Field       | Value                              |
|-------------|------------------------------------|
| **Type**    | chat                     |
| **Status**  | allowed                   |
| **Channel** | chat |

**Sample User Queries This Trigger Handles:**

- "Create a repo called acme-api in my org."
- "Draft a PR title and description for this branch."

---

### T002 — Direct Slack message from the user requesting GitHub administration.

| Field       | Value                              |
|-------------|------------------------------------|
| **Type**    | slack                     |
| **Status**  | allowed                   |
| **Channel** | slack |

**Sample User Queries This Trigger Handles:**

- "Open a PR for this branch."
- "Add labels and reviewers to PR 42."

---

### T003 — Ambient Slack conversation or non-direct chatter must not trigger work.

| Field       | Value                              |
|-------------|------------------------------------|
| **Type**    | slack                     |
| **Status**  | blocked                   |
| **Channel** | slack |

---

### T004 — Merge or destructive/high-impact action awaits an explicit second confirmation.

| Field       | Value                              |
|-------------|------------------------------------|
| **Type**    | approval                     |
| **Status**  | pending                   |
| **Channel** | chat |

**Sample User Queries This Trigger Handles:**

- "Yes, merge action ID 12345."
- "Confirm delete repo request."

