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
| `/pm-project-init` | Verify connections, settle the KE project's name, walk you through creating its ClickUp List from the standard template, and record its facts in the List description. Run once per KE project. |
| `/pm-project-brief` | Interview you, then write the project `Brief` doc on the List. |

**Run them in either order.** Set the List up first and the Brief reads its
facts instead of asking. Write the Brief first and `pm-project-init` takes what it
can from the Brief, then offers to publish it. A KE project is ready to work when
it has both.

## What ends up in ClickUp

```
ClickUp List  (the KE project)
├── description  ← /pm-project-init   owner, squad, roadmap or not,
│                                original + current target, capitalizable
├── due date     ← you, by hand         a copy of the current target,
│                                so ClickUp's roadmap views can sort
└── Brief (doc)  ← /pm-project-brief  Summary, Problem, Goals, Users, Approach,
                                 Open Questions & Risks
```

`ke-pm` creates exactly one document, the `Brief`. The KE project's facts go on
the List itself — a document that exists only so the tooling can read it back
would be clutter in a place meant for team documents.

### You create the List, not Claude

The ClickUp MCP server has no template tools: it cannot list templates and
cannot create a List from one. So `/pm-project-init` settles the names,
hands you a link that opens ClickUp's template center on the right template,
tells you which Folder to put it in and exactly what to call it, and waits. You
click **Use template**, paste the List URL back, and the skill carries on —
resolving the URL, checking the List landed where it should, and working out
whether it still needs setting up or is a re-run.

Keep that URL. The skills store nothing of their own, so a List URL is the whole
handle: given it, any later session can read the List and tell where the KE
project stands. That is why setup asks you to put it in your Claude Project's
knowledge.

ClickUp's REST API has supported creating a List from a template for years — the
gap is in their MCP server. If they close it, the handoff disappears and the
skill goes back to making the List itself.

Nothing else. Task breakdown, sequencing, and acceptance criteria deliberately
stay out — those belong on the tasks. A Brief that tries to be a spec is the
failure mode this process exists to avoid.

## What lives in the Claude Project

ClickUp holds the record. The Claude Project holds the workbench: transcripts,
research notes, Slack threads, the raw material you are working from.

`/pm-project-init` cannot create a Claude Project — no skill can — so it explains how
to set one up and what to keep in it. Nothing in `ke-pm` requires one; the
skills read everything they need from ClickUp. It just makes the drafts better.

The line to hold: if someone else would need it to understand the KE project, it
goes to ClickUp.

## Requirements

### ClickUp — required

Everything depends on it. `/pm-project-init` stops if it is missing.

How it gets there depends on where you are running:

- **Installed as a Claude Code plugin** — the server ships with the plugin and
  registers as `plugin:ke-pm:clickup`. Nothing to configure; run `/mcp` to
  authorize it.
- **claude.ai** — the plugin manifest is ignored. Add
  `https://mcp.clickup.com/mcp` as a custom Connector in settings.
- **Running from source with `--plugin-dir`** — the repo's own `.mcp.json`
  covers you inside this directory. Elsewhere, add the block by hand:

  ```json
  {
    "mcpServers": {
      "clickup": { "type": "http", "url": "https://mcp.clickup.com/mcp" }
    }
  }
  ```

Restart Claude Code and approve the server when prompted. If `pm-project-init`
reports no ClickUp, `/mcp` tells you which case you are in: the server listed
means it needs authorizing, the server absent means it needs configuring.

### Slack — checked, not required

`/pm-project-init` reports whether Slack tooling is reachable, because the weekly
project update and stand-ups live there. Neither `pm-project-init` nor
`pm-project-brief` needs it, so a missing Slack connection is a warning, never a
blocker.

> **Setup note:** the exact Slack MCP endpoint is not yet pinned down for
> Kalkomey. Until it is, `pm-project-init` probes for whatever Slack tooling is present and
> reports what it found. Fill this section in once we settle on a server.

## Installing

### Claude Code

```bash
claude plugin marketplace add kalkomey/ke-pm
claude plugin install ke-pm@ke-pm
```

The ClickUp MCP server ships with the plugin and registers as
`plugin:ke-pm:clickup`. It still needs authorizing once — run `/mcp`, approve
it, and start a new session — before any skill can reach ClickUp.

To try it without installing:

```bash
git clone git@github.com:kalkomey/ke-pm.git ~/tools/ke-pm
claude --plugin-dir ~/tools/ke-pm
```

### The Claude app (claude.ai)

claude.ai does not read the plugin manifest. Each skill is uploaded on its own,
as a zip:

```bash
./scripts/package.sh
```

That writes `dist/pm-project-init.zip` and `dist/pm-project-brief.zip`. Upload each
at **Settings → Capabilities → Skills**.

Two differences from Claude Code:

- **No slash commands.** `commands/` is a Claude Code concept. The skills trigger
  from their descriptions — say what you want ("set this project up in ClickUp",
  "write the brief") and the right one activates.
- **ClickUp does not come along.** The plugin's `.mcp.json` is ignored, so add
  `https://mcp.clickup.com/mcp` as a **custom Connector** in claude.ai settings.
  Without it, `pm-project-init` stops at its connection check.

Each skill folder is self-contained so the zips work standalone. That is why
`naming-rules.md` exists twice — see [AGENTS.md](AGENTS.md).

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
