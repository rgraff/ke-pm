# AGENTS.md

## What ke-pm is

Claude Code skills for running a KE project the way the Kalkomey playbook
describes. Phase 1 covers setting the KE project up in ClickUp
(`/ke-pm:clickup-init`) and writing its Brief (`/ke-pm:brief`). Either can come
first — neither skill may assume the other has already run.

Read [GLOSSARY.md](GLOSSARY.md) before writing any skill prose. "Project" alone
is ambiguous here and we never use it bare.

## Three rules that shape everything

**1. ClickUp is the only state.** No local files, no Claude-side memory, no
config in the user's repo. If a skill needs to remember something, it writes a
doc on the List. A teammate with ClickUp access can see everything `ke-pm`
produced; a teammate without Claude loses nothing.

**2. The user does not have the playbook.** Assume no access to
`kalkomey/playbook`. Every rule a skill applies is copied into a `references/`
file here, headed with `Source: kalkomey/playbook — <page> (as of YYYY-MM-DD)`.
That line is provenance so we can spot drift; it is not a runtime dependency. No
skill fetches or reads the playbook, and skill output does not link to it.

A Claude Project may hold working context — transcripts, notes, drafts — but
never state of record, and no skill can write to one. When `clickup-init` talks about
Claude Projects it is giving the user instructions, not doing something.

**3. Discover, never hardcode.** Space IDs, Folder IDs, List templates — all
found at runtime through the ClickUp MCP and confirmed with the user. A ClickUp
reorganisation should not break a skill.

## Layout

```
.claude-plugin/
├── plugin.json            # name: ke-pm → /ke-pm:* namespace
└── marketplace.json       # claude plugin marketplace add kalkomey/ke-pm

commands/                  # thin wrappers — invoke the matching skill, nothing else
├── clickup-init.md        # → /ke-pm:clickup-init
└── brief.md               # → /ke-pm:brief

skills/
├── clickup-init/
│   ├── SKILL.md           # the active workflow
│   ├── references/        # connections, existing brief, clickup conventions,
│   │                      # squads, list description, claude project,
│   │                      # troubleshooting, edge cases
│   └── examples/          # worked scenarios
└── brief/
    ├── SKILL.md
    ├── references/        # brief template, naming rules, writing style,
    │                      # interview guide, troubleshooting, edge cases
    └── examples/

.mcp.json                  # ClickUp MCP server
GLOSSARY.md                # KE project / ClickUp List / Claude Project
```

### Progressive disclosure

- **Frontmatter** — always loaded; decides when the skill activates.
- **SKILL.md body** — loaded on activation. The active workflow only. Keep it
  under 5,000 words.
- **`references/` and `examples/`** — loaded on demand, when SKILL.md points at
  them. Vendored playbook guidance, troubleshooting, and worked scenarios live
  here so the workflow stays short.

### Shared references

`skills/clickup-init/SKILL.md` reads the naming rules from
`../brief/references/naming-rules.md` rather than keeping a second copy — a KE
project gets named in both skills and the rules must not drift between them.
Cross-skill reference reads are fine within the plugin; duplicated rules are not.

## Adding a skill

1. `skills/<name>/SKILL.md` with the standard sections: **When to use /
   Inputs / Workflow / Output / More**.
2. Vendor any playbook guidance it needs into `references/`, with the source
   citation line.
3. A thin `commands/<name>.md` wrapper whose only job is to invoke the skill.
4. Update the command tables in `README.md` and `AGENTS.md`.
