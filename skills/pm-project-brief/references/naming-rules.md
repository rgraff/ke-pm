# KE project naming rules

> Source: kalkomey/playbook — `standards/project-name-and-briefs.md`
> (as of 2026-08-15)

Read by `/ke-pm:pm-project-brief` when validating a name, and by `/ke-pm:pm-project-init` before it
creates a List. One copy, so the two skills cannot drift apart.

The name is a **short phrase**, not a mini write-up. It must be specific enough
that nobody confuses it with another KE project.

## The rules

**Verb followed by noun.** The verb is optional. If you omit it, the assumed
verb is "build" or "implement".

❌ "Broken Login Flow"
✅ "Address UX issues in HuntWise login flow"

**Check that the assumed verb works.** "Broken Login Flow" fails because it
reads as "Build Broken Login Flow", which is nonsense. Use an explicit verb:
"Fix Login Flow".

**Avoid open-ended names.** "Improve Login Flow" can go on forever. That is a
good initiative, not a KE project — a KE project needs an agreed-upon
conclusion. If the name has no end state, the work probably does not either, and
that is worth saying out loud.

**Include product context.** Names get aggregated into reports and cross-team
views with no squad folder around them. The name has to stand alone:
"Implement HuntWise Login Flow 2.0", not "Login Flow 2.0".

**Plain language.** No jargon, no business speak.

## Two names, one KE project

The rules above give you the **KE project name** — the full, readable one. It
goes on the Brief and in the List description.

The **ClickUp List name** is a display label. It appears in sidebars, folder
trees, and view pickers, all of which truncate. A 40-character name shows up as
"Address UX issues in Hunt…" everywhere it matters, which defeats the point of
writing a careful name.

Keep the List name to **20–26 characters**. When the KE project name is longer
than that, propose a short form. Under 20 is fine when the name is genuinely
that short — the range is a ceiling to work under, not a length to pad to.

### Abbreviating well

- **Keep the product marker.** The List name still has to stand alone in a
  cross-team view. "Login flow UX" could be any of the brands; "HW login flow
  UX" could not.
- **Drop the verb first.** It is the most compressible part, and "build" or
  "implement" is assumed anyway.
- **Keep the noun that distinguishes it** from every other List in the Folder.
- **Use short forms people already say** — HW for HuntWise, wx for weather. Do
  not invent an acronym nobody will recognise; a cryptic List name is worse than
  a truncated one.

| KE project name | List name |
|---|---|
| Address UX issues in HuntWise login flow | `HW login flow UX` |
| Ship severe-weather push alerts for Rangers | `Rangers wx alerts` |
| Reduce drop-off in Boat Ed first lesson | `BoatEd lesson 1` |

### Offer a real choice

Do not hand over one short form and ask for a yes. The List name is what the
squad reads in the sidebar every day, and the person running the skill knows
which abbreviations their team actually says.

Offer **three candidates that differ in what they lead with**, not three
rewordings of the same idea:

| Leads with | For "Address UX issues in HuntWise login flow" |
|---|---|
| The brand | `HW login flow UX` (16) |
| The outcome | `HW login friction` (18) |
| The surface | `HW login page rework` (20) |

Show the character count with each, and always leave room for the user to type
their own. Take what they write as-is; push back only if it runs well past 26
characters, and then only once.

If nothing fits, the KE project name may be doing too much. That is worth
saying — a name nobody can shorten is often a name covering two pieces of work.

## How to check a name

Ask these in order:

1. Does it have a verb, or does the assumed "build" make sense in front of it?
2. Can you tell when it is done?
3. Would someone in another squad know what it refers to, seeing it in a
   list with no other context?
4. Is it free of jargon?

A failure on 2 usually means the user is describing an initiative. A failure on
3 usually means the product name is missing.

## When a name fails

Say which rule it breaks, in one sentence, then offer two or three alternatives.
Do not lecture — the user wants a name, not a style seminar.

Renaming is cheap before the List exists and annoying afterwards: the old name
is already in reports, Slack posts, and people's heads.

If the user wants to keep a name that breaks a rule, that is their call. Record
it and move on.
