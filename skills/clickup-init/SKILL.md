---
name: clickup-init
description: Set up a KE project in ClickUp — verify the ClickUp and Slack connections, find or create the project's List from a template, and record the project's facts in the List description. Use when starting a new KE project, when adopting an existing ClickUp List into the ke-pm workflow, or when a Brief has been written and now needs a home in ClickUp. Triggers on 'set this up in ClickUp', 'create the List', 'start a new project', 'the brief is written, now what', '/ke-pm:clickup-init'. Run once per KE project, before or after the Brief.
argument-hint: "[KE project name or idea]"
allowed-tools:
  - AskUserQuestion
  - Read
  - ToolSearch
---

## When to use
- The user is starting a new KE project and needs it set up in ClickUp.
- A Brief already exists — drafted here or written elsewhere — and the KE project
  now needs a ClickUp List to live on.
- The user has an existing ClickUp List and wants to adopt it into the `ke-pm`
  workflow.
- Another `ke-pm` skill stopped because the KE project's facts are missing from
  the List.
- The user explicitly invokes `/ke-pm:clickup-init`.

**Order does not matter.** A KE project can be set up in ClickUp first and
briefed after, or briefed first and set up after. This skill handles both, and
`/ke-pm:brief` handles the mirror case. Run this once per KE project. Running it
again on a List that already has its facts recorded is an update, not a
re-scaffold — see `references/edge-cases.md`.

## Inputs
- Required: a working ClickUp MCP connection. Nothing in this skill works without it.
- Optional `$ARGUMENTS`: the KE project name or a one-line idea.
- Optional: an existing Brief, in any form. Asked for in step 2.
- Everything else is gathered by asking.

Read [GLOSSARY.md](../../GLOSSARY.md) if the difference between a **KE project**,
a **ClickUp List**, and a **Claude Project** is not already clear. Use those
terms exactly when talking to the user; never say "project" alone.

## Workflow

### 1. Verify connections

Follow `references/connections.md`. In short:

- **ClickUp** — `ToolSearch "+clickup"`. If no tools come back, **stop**. Give
  the user the `.mcp.json` block from `references/connections.md` and the
  restart instruction. Do not continue and do not offer a workaround; every
  remaining step writes to ClickUp. If they do come back, look up the
  authenticated ClickUp user — it confirms the connection resolves to a real
  account, and it is the name you offer as the owner in step 6.
- **Slack** — `ToolSearch "+slack"`. If nothing comes back, **warn and
  continue**: say that `/ke-pm:update` and `/ke-pm:standup` will not be able to
  post when they arrive, and that nothing here or in `/ke-pm:brief` needs it.

Report both results in one short status line each before moving on. The user
should know what is connected before they answer six questions.

### 2. Ask whether a Brief already exists

Do this before asking for anything else. A Brief that already exists usually
answers half of what comes next, and making someone re-supply what they have
already written is the fastest way to make setup feel like paperwork.

Ask plainly: has a Brief been written for this KE project yet? Accept it in any
form — pasted text, a file in the Claude Project, a doc elsewhere in ClickUp, a
link. Follow `references/existing-brief.md` for what to take from it and how far
to trust it.

If there is no Brief yet, say that is fine and carry on. It gets written after,
with `/ke-pm:brief`.

### 3. Identify the squad

Ask which squad owns this KE project, offering the list from
`references/squads.md`. Record the squad and its team emoji — later skills lead
every Slack post with that emoji, and there is no other place it gets captured.

Squads get renamed and created faster than that table gets updated, so treat it
as a starting point. If Slack is connected and the user names a squad that is
not in it, check the recent thread openers in `#standups` for the live answer
before accepting a new one — most "new" squads turn out to be renames.
`references/squads.md` covers how far to go before taking one on trust.

### 4. Find where it belongs in ClickUp

Discover the structure; never assume it. Using the ClickUp MCP tools, find the
Space and Folder for that squad and confirm the destination with the user before
creating anything. If several look plausible, show what you found and ask. If
the workspace is organised differently than you expect, ask — do not guess a
destination.

### 5. Locate or create the List

Ask whether this KE project already has a ClickUp List.

**Adopting an existing List:**
- Search for it, show what you found, and confirm the match with the user.
- Read the current List description and check for an existing `Brief` doc. If
  the description already holds the facts, this is an update — see
  `references/edge-cases.md`.

**Creating a new List:**
- **Settle the KE project name first.** Read
  `../brief/references/naming-rules.md` and apply it before the List exists. If
  a Brief exists, take the name from it and still check it against the rules — a
  name that has only ever been a document title has never had to stand on its
  own in a report. Renaming later is worse than getting it right now. Offer two
  or three candidates and let the user pick or refine.
- **Then settle the List name.** If the KE project name is 20 characters or
  fewer, use it as-is and say so. If it is longer, the List needs a short form —
  and that is worth a real choice rather than a suggestion, because the List
  name is what the squad reads in the sidebar for the life of the KE project.

  Use `AskUserQuestion` to offer **three distinct candidates**, not three
  rewordings of one idea, following the abbreviation guidance in
  `../brief/references/naming-rules.md`. Give each one its character count and
  say what it leads with. The user can always type their own — take it as-is
  unless it runs well past 22 characters, and even then say so only once.

  Frame the question against the full name so the trade-off is visible: the KE
  project is "Address UX issues in HuntWise login flow", 40 characters, which
  ClickUp truncates in every sidebar and picker. The full name is preserved in
  the List description and on the Brief either way.
- **Pick a template by discovery.** List the workspace's available List
  templates through the ClickUp MCP and show the candidates to the user with
  their names. If `t-901419142237` is among them, mark it as the expected
  default — but always show the list and always let the user choose. Never apply
  a template without showing what you are applying.
- Create the List from the chosen template in the confirmed Folder.
- If the MCP cannot list or apply templates, say so plainly, create the List
  without one, and tell the user to apply the template through the ClickUp UI.
  Record `Template applied: none (apply manually)` in the description. Do not
  silently skip it — see `references/troubleshooting.md`.

### 6. Gather the KE project's facts

Anything step 2 pulled out of an existing Brief, **confirm rather than ask**:
"The Brief says the target is September 30 — still right?" Ask outright only for
what is genuinely unanswered.

- **Owner** — default to the current user. Get their name from the authenticated
  ClickUp account rather than guessing, then confirm it: "Owner is [name] —
  right, or is someone else taking this?" Most of the time the person running
  this skill owns the KE project, so it should be one keystroke. It is not
  automatic, though: a PM setting a List up on behalf of an engineering lead is
  common enough that assuming would put the wrong name on it. If the ClickUp
  account lookup is not available, just ask.
- **Roadmap project or not** — does leadership track this on the roadmap? Ask it
  early; it sets the bar for everything after. A roadmap project owes a weekly
  project update in `#project-updates`; for everything else that update is
  optional. Do not infer it from how important the work sounds, and do not infer
  it from a Brief unless the Brief says so — ask.
- **Original target date** — the committed date. Capture it now: it never
  changes afterwards, and the weekly update's header math cannot be
  reconstructed without it.
- **Projected target date** — today's best estimate. Same as the original at
  kickoff. This becomes the List's due date.
- **Capitalizable** — yes or no, as designated during planning between Product,
  Engineering, and Accounting. If the user does not know, record "not yet
  designated" and tell them to confirm with their PM. Do not guess, and do not
  designate it yourself.

Ask in small groups, not one long interrogation.

### 7. Record the facts on the List

Follow `references/list-description.md`. Two writes:

- **The List description** gets the fact block. Preserve any prose already
  there — add or update the fact lines around it, never replace the whole
  description.
- **The List's due date** gets the projected target.

Show the user the full proposed description before writing, and get
confirmation.

If the MCP cannot write the description, say so and fall back to a doc named
exactly `Project Details` on the List, as described in
`references/list-description.md`. Tell the user where the facts ended up.

### 8. Land the Brief, if there is one

If step 2 turned up a Brief that is not yet a `Brief` doc on this List, check it
against the requirements in `references/existing-brief.md` — the six sections in
the right order, the KE project name at the top, no placeholders left in, and no
execution detail that belongs on the tasks.

**If it passes**, publish it: create a doc named exactly `Brief` on the List,
after showing the user what you are posting. There is no reason to send a Brief
that already meets the standard through an interview it does not need.

**If it does not**, say specifically what is off — a missing `Users` section, a
`Background` section that is not part of the template, requirements that belong
on tasks — and point the user at `/ke-pm:brief` to refine it. That skill owns
the template, the section order, and the style pass. Do not fix it yourself
here and do not post it as-is.

If there is no Brief yet, say so plainly — the KE project is not ready to work
until it has one, and `/ke-pm:brief` is the next step.

### 9. Set up the Claude Project

Follow `references/claude-project.md`.

You cannot create a Claude Project — no tool does that. Tell the user how, and
what to keep in it: name it after the KE project, put the ClickUp List URL in
its knowledge, add the raw material they are working from, and keep decisions
flowing back to ClickUp rather than living in the chat.

If they are already working inside a Claude Project for this KE project, just
confirm the List URL is in its knowledge and move on. If they would rather not
bother, drop it — nothing in `ke-pm` depends on it.

### 10. Confirm and hand off

Report the List URL, then point at whichever step is actually next: writing the
Brief, publishing the one they already have, or nothing further if it is already
on the List.

If this is a roadmap project, say so here too: a weekly project update in
`#project-updates` is required, starting the first week work begins. Better they
hear it now than the first week it is missed.

## Output
- A ClickUp List for the KE project, created from a chosen template or adopted.
- The KE project's facts in that List's description, and the projected target as
  its due date.
- Spoken guidance on setting up the user's Claude Project. Nothing is written
  there — no skill can.
- Nothing written outside ClickUp. This skill creates no local files.

## More
- Connection checks and setup instructions: `references/connections.md`
- Working from a Brief that already exists: `references/existing-brief.md`
- ClickUp conventions, template discovery, doc naming: `references/clickup-conventions.md`
- Squads and team emojis: `references/squads.md`
- The fact block, and what goes in the due date: `references/list-description.md`
- Setting up the Claude Project and what belongs in it: `references/claude-project.md`
- KE project naming rules: `../brief/references/naming-rules.md`
- Common failures and fixes: `references/troubleshooting.md`
- Edge cases (re-running it, adopting a populated List): `references/edge-cases.md`
- Worked examples: `examples/new-list-from-template.md`, `examples/adopting-an-existing-list.md`, `examples/brief-first.md`
