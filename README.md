> # ⚠️ THIS REPO IS TEMPORARY
>
> **These skills will be merged into Kalkomey's main skills repository
> (`kalkomey/ai-workflow-tools`) once they have proven themselves.**
>
> `ke-pm` exists so we can iterate on product-management skills quickly without
> destabilising the tooling engineers already install. Expect the install path,
> the command namespace, and this repo's URL to change. Do not build anything
> on top of it that would be painful to re-point.

# ke-pm — Kalkomey product management skills

Claude Code skills for running a **KE project** the way the Kalkomey playbook
describes: set the project up in ClickUp, then write its Brief.

**ClickUp is the source of truth.** These skills hold no state of their own —
no local files, no Claude-side memory. Everything they produce is a document on
the project's ClickUp List, where the rest of the team can see it.

## Words we use carefully

The same word means three different things depending on where you are standing,
so this repo is strict about which one it means. See [GLOSSARY.md](GLOSSARY.md).

| Term | Meaning |
|---|---|
| **KE project** | A project as the playbook defines it: bounded scope, an owner, an expected delivery window. |
| **ClickUp List** | Where a KE project lives in ClickUp. One KE project = one List. |
| **Claude Project** | A project inside Claude, used to hold context for a KE project. |

## Commands

| Command | What it does |
|---|---|
| `/ke-pm:clickup-init` | Verify connections, find or create the KE project's ClickUp List, and record its facts in the List description. Run once per KE project. |
| `/ke-pm:brief` | Interview you, then write the project `Brief` doc on the List. |

**Run them in either order.** Set the List up first and the Brief reads its
facts instead of asking. Write the Brief first and `clickup-init` takes what it
can from the Brief, then offers to publish it. A KE project is ready to work when
it has both.

## What ends up in ClickUp

```
ClickUp List  (the KE project)
├── description  ← /ke-pm:clickup-init   owner, squad, roadmap or not,
│                                original target, capitalizable
├── due date     ← /ke-pm:clickup-init   the projected target
└── Brief (doc)  ← /ke-pm:brief  Summary, Problem, Goals, Users, Approach,
                                 Open Questions & Risks
```

`ke-pm` creates exactly one document, the `Brief`. The KE project's facts go on
the List itself — a document that exists only so the tooling can read it back
would be clutter in a place meant for team documents.

Nothing else. Task breakdown, sequencing, and acceptance criteria deliberately
stay out — those belong on the tasks. A Brief that tries to be a spec is the
failure mode this process exists to avoid.

## What lives in the Claude Project

ClickUp holds the record. The Claude Project holds the workbench: transcripts,
research notes, Slack threads, the raw material you are working from.

`/ke-pm:clickup-init` cannot create a Claude Project — no skill can — so it explains how
to set one up and what to keep in it. Nothing in `ke-pm` requires one; the
skills read everything they need from ClickUp. It just makes the drafts better.

The line to hold: if someone else would need it to understand the KE project, it
goes to ClickUp.

## Requirements

### ClickUp — required

Everything depends on it. `/ke-pm:clickup-init` stops if it is missing.

The repo ships a `.mcp.json` pointing at ClickUp's hosted MCP server. If you are
running these skills from somewhere else, add the same block to that project's
`.mcp.json`:

```json
{
  "mcpServers": {
    "clickup": { "type": "http", "url": "https://mcp.clickup.com/mcp" }
  }
}
```

Restart Claude Code and approve the server when prompted.

### Slack — checked, not required

`/ke-pm:clickup-init` reports whether Slack tooling is reachable, because the skills
planned for phase 2 (`/ke-pm:update`, `/ke-pm:standup`) post there. Neither
`clickup-init` nor `brief` needs it, so a missing Slack connection is a warning, never a
blocker.

> **Setup note:** the exact Slack MCP endpoint is not yet pinned down for
> Kalkomey. Until it is, `clickup-init` probes for whatever Slack tooling is present and
> reports what it found. Fill this section in once we settle on a server.

## Installing

```bash
claude plugin marketplace add kalkomey/ke-pm
claude plugin install ke-pm@ke-pm
```

To try it without installing:

```bash
git clone git@github.com:kalkomey/ke-pm.git ~/tools/ke-pm
claude --plugin-dir ~/tools/ke-pm
```

## Where the process comes from

Every rule these skills apply — the Brief template, the project naming rules,
the writing style, the squad emoji table — comes from the Kalkomey
playbook (`kalkomey/playbook`).

**You do not need access to the playbook to use these skills.** The guidance is
copied into this repo's `references/` files. Each one names the playbook page it
came from and the date it was copied, so we can spot drift — that citation is
provenance, not a dependency. Nothing here reads the playbook at runtime.

If you change the process, change the playbook first. This repo follows it.

## Credits

Repository structure — plugin packaging, thin commands over fat skills,
progressive disclosure through `references/` and `examples/` — is modelled on
[BJClark/jeff](https://github.com/BJClark/jeff). The workflow itself is
Kalkomey's.

## Licensing

Deferred. This is a private, temporary repo; the licensing question belongs to
the merge into `kalkomey/ai-workflow-tools`.
