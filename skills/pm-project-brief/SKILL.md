---
name: pm-project-brief
description: Write or update the Brief doc on a KE project's ClickUp List, following the Kalkomey Brief template. Interviews the user before writing anything, validates the KE project name, drafts the six required sections, and applies the house writing style. Use when a KE project needs its Brief, when an existing Brief is stale, or when someone asks what a project is for. Triggers on 'write the brief', 'draft a project brief', 'the brief is out of date', 'name this project', '/pm-project-brief'. Replaces the PRD — it is not a spec.
argument-hint: "[KE project name or ClickUp List URL]"
allowed-tools:
  - AskUserQuestion
  - Read
  - ToolSearch
---

## When to use
- A KE project has a ClickUp List but no `Brief` doc.
- A KE project is being briefed before it exists in ClickUp at all.
- An existing Brief no longer matches reality and needs updating.
- The user wants help naming a KE project (the name rules live here).
- The user explicitly invokes `/pm-project-brief`.

Every KE project must have a Brief. It sizes up the problem, why it matters, and
the shape of the work — and stops there.

**Order does not matter.** The Brief can be written before the ClickUp List
exists or after. Step 1 works out which situation you are in; step 6 lands the
Brief either way.

## Inputs
- Required: nothing. The interview can start from a blank page.
- Useful: a ClickUp List for the KE project, and the facts
  `/pm-project-init` records in its description — they save you asking.
- Optional `$ARGUMENTS`: KE project name or List URL.
- Optional and very useful: Slack threads, transcripts, emails, docs, support
  data, analytics, research. Step 2 asks for these one kind at a time rather
  than waiting to be handed them.

Three different things get called "project", so this skill never says the word
alone:

- **KE project** — a project as the playbook defines it: bounded scope, one
  owner, an expected delivery window. The unit this skill briefs.
- **ClickUp List** — where a KE project lives in ClickUp. One KE project = one
  List. "The List" always means this.
- **Claude Project** — a project inside Claude, holding context for one KE
  project. Nothing is stored there.

## Workflow

### 1. Work out where this KE project stands

Ask whether it already exists in ClickUp, or find it from `$ARGUMENTS`. Three
situations, all fine:

**The List exists and has its facts.** Read the description — owner, squad,
whether this is a roadmap project, target dates, capitalizable designation — so
you do not ask for any of it again. If the facts are not in the description,
check for a `Project Details` doc, which is where `/pm-project-init` falls
back to. If there is already a `Brief` doc, read it: this is an update, and step
6 handles it differently.

**The List exists but has no facts.** Carry on with the Brief. Mention once that
`/pm-project-init` records the facts on the List, and leave it there — do not
turn the Brief into a setup session.

**There is no List yet.** Also fine, and common: plenty of KE projects get
briefed before anyone opens ClickUp. Run the interview from a blank page. Step 6
creates the List when the draft is ready, so the writing is not blocked on
setup.

### 2. Collect the context

A Brief written from real material beats one written from a template every time,
so this step is worth spending questions on.

**Ask one source at a time, and wait for an answer before naming the next.** A
single "send me anything you have" reliably gets "not really" from someone who
has three Slack threads and a customer call they have forgotten about. Naming
one kind of source at a time makes them go and look.

Work down this list, skipping anything already supplied:

1. **Slack threads** — where was this discussed?
2. **Meeting transcripts or notes** — has there been a call about it?
3. **Emails** — anything from a customer, a partner, or leadership?
4. **Documents or decks** — an earlier proposal, a strategy doc, a one-pager?
5. **Tickets or support data** — Zendesk tags, bug reports, complaint volume?
6. **Analytics** — a dashboard, a funnel, a number someone quoted?
7. **Research or designs** — past interviews, Figma files, prototypes?
8. **Anything else** — the catch-all, asked last rather than first.

Take whatever comes back, including half-formed thoughts. Two or three sources
is usually plenty; do not march through all eight when the user has clearly
given you what exists. If they say no to the first four, ask the catch-all and
move on to the interview — this is a prompt for their memory, not an intake
form.

### 3. Interview before writing anything

**Do not draft the Brief until the user tells you to start.** This is the single
most important rule in this skill, and it comes straight from the playbook.

Work through `references/interview-guide.md`. Ask **one question at a time** and
let the answer shape the next question. You are trying to reach the point where
all six sections can be filled honestly — not the point where they can be filled
plausibly.

Stop asking when either:
- you can fill every section from what the user actually said, or
- what is left is genuinely undecided, in which case it becomes `TBD`.

`TBD` is an honest answer for `Approach` and `Open Questions & Risks` early on.
An invented approach is not. Do not pad a section to make the doc look finished.

**If the List description says this is a roadmap project**, hold a higher bar:
leadership tracks it and its weekly update reports against these goals, so
`Goals or Success Metrics` needs real, measurable answers rather than
aspirations. If the user cannot give you any, say plainly that a roadmap project
without a measurable goal will produce a weekly update nobody can read, and put
the gap in `Open Questions & Risks`.

When you think you have enough, say so and ask whether to write it.

### 4. Validate the KE project name

Read `references/naming-rules.md` and check the **full KE project name** against
it — the `Full Project Name:` line in the List description, not the List's own
name, which is often a short form so it does not truncate in ClickUp's sidebar.

The short version: verb followed by noun; the assumed verb is "build" or
"implement" if you omit it; the name must make sense on its own in a report that
has no Folder for context; no open-ended names.

If the name fails, say which rule it breaks and offer two or three alternatives.
Renaming is cheap now and expensive later. If the user keeps the name anyway,
that is their call — record it and move on.

### 5. Draft the Brief

Follow `references/brief-template.md` exactly: the full KE project name as the
opening heading, then the same six `###` headings, in the same order, no extras.
The Brief and the List description are the only two places the full name is
written out, so it is not optional.

Keep `Summary` above the fold — someone opening the doc should get problem,
solution, and value in one or two sentences without scrolling.

Then run the style pass in `references/writing-style.md`: grade 9 reading level,
one idea per sentence, plain words, none of the banned business words, no
filler. Strip solution language out of `Problem` — that section describes what
is broken or missing, not what you plan to build.

**Stay out of execution detail.** No task breakdown, no sequencing, no who-does-
what-this-week, no acceptance criteria. That detail belongs on the tasks, where
it can change as you learn. A Brief that specifies the build is the failure mode
this whole process exists to avoid. If the user pushes for it, say where it goes
instead.

### 6. Publish to ClickUp

Show the full draft in the conversation and get explicit confirmation before
writing anything.

**If the List exists:**
- No `Brief` doc yet — create one, named exactly `Brief`.
- `Brief` already there — show what is changing before you touch it. Never
  silently overwrite a doc someone else may have edited. If the changes are
  extensive, offer to walk section by section.

**If there is no List yet**, the Brief has nowhere to live — and there are two
reasons for that, which want opposite handling. Ask which one this is:

> Is this a proposal you are writing to get buy-in, or is the KE project
> greenlit and just not set up in ClickUp yet?

- **A proposal.** Normal, and the most common reason a Brief lives outside
  ClickUp. There is no KE project yet, so there is nothing to put a List on. Do
  not push toward ClickUp and do not treat the missing List as a problem to
  solve — see `references/edge-cases.md`.
- **Greenlit, not set up yet.** Offer to run `/pm-project-init` now: it sets
  the List up, and the Brief you just wrote answers most of what it would
  otherwise ask. Then publish.

Ask rather than assume. Guessing "proposal" leaves a real KE project's Brief
sitting in a chat window; guessing "greenlit" pushes someone into creating a
List for work nobody has agreed to do.

When the Brief stays unpublished either way, say plainly that it is not saved
anywhere, hand them the full markdown, and suggest keeping it in the Claude
Project until there is a decision. Do not write it to a local file —
the next session would find a copy that nobody else can see and that nothing
keeps current.

Report the doc URL once it lands.

### 7. Say what happens next

Remind the user that `Approach` and `Open Questions & Risks` are expected to
fill in as discovery proceeds, and that the Brief should stay high level as the
KE project ages. Detail belongs on the tasks.

## Output
- A `Brief` doc on the KE project's ClickUp List, following the six-section
  template.
- Or, when there is no List and the user does not want one yet, a finished draft
  in the conversation and nothing written anywhere.
- Nothing written outside ClickUp. No local files, nothing stored in the Claude
  Project.

## More
- The Brief template: `references/brief-template.md`
- KE project naming rules: `references/naming-rules.md`
- House writing style and banned words: `references/writing-style.md`
- What to ask, in what order: `references/interview-guide.md`
- Common failures and fixes: `references/troubleshooting.md`
- Edge cases (handed a PRD, it is really an initiative, Brief already exists): `references/edge-cases.md`
- Worked examples: `examples/from-a-slack-thread.md`, `examples/renaming-an-open-ended-project.md`, `examples/updating-an-existing-brief.md`
