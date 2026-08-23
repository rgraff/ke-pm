# Where the KE project's facts live

`/pm-project-init` records the KE project's facts on the ClickUp List itself. There
is no separate document — the facts sit in the List's own description, in List
Info, where anyone who opens the List sees them.

## What goes where

| Fact | Where it lives |
|---|---|
| Both target dates | The List **description** — the record of truth |
| Everything else | The List **description** |
| A copy of the current target | The List's **due date**, set by the user, for ClickUp's views |

**Both target dates go in the description**, on separate lines. ClickUp has one
date field per List, so it cannot hold two, and the pair only means something
together: the original is committed once and never moves, the current one tracks
today's estimate, and the gap between them is the slip. Recording only one erases
the ability to tell whether the commitment held.

**The description is the record; the due date is a copy.** That is the way round
it has to be, because the MCP can neither read the due date nor write it (see
`troubleshooting.md`). A field no skill can see cannot be the source of anything
— every later skill reads the dates from these lines.

The copy still earns its place: the List's native due date is what every roadmap
view in the workspace sorts and filters on, and a date living only in description
text is invisible to them. Ask the user to set it to the current target and say
why. Never report it as set, and never treat it as authoritative when it
disagrees with the description — you cannot see it to compare.

**The description is the only date record the skill can see.** So when it already
holds target dates, confirm those rather than asking cold — and ask for the
original before the current one when it does not. Someone asked for "the target
date" gives today's estimate, and recording that as the original quietly erases
whatever slip has already accumulated.

## The description block

```markdown
**Full Project Name:** [the full name — the List name may be an abbreviation of it]
**Owner:** [who owns this KE project]
**Squad:** [squad] :wg-emoji:
**Roadmap project:** Yes | No
**Original target:** YYYY-MM-DD (committed at kickoff; never changes)
**Current target:** YYYY-MM-DD (today's estimate; set the List due date to match)
**Capitalizable:** Yes | No | Not yet designated
**Set up:** YYYY-MM-DD by [name]
```

Keep it to these lines. The description holds facts; narrative belongs in the
`Brief`.

## Writing it without destroying what is there

A List description may already have content — a note from whoever created the
List, links, context someone added by hand. Never replace it wholesale.

- Keep any existing prose.
- Add or update the fact lines above.
- Show the user the full proposed description and get confirmation before
  writing.

## Reading it back

Later skills read these facts from the description. Parse leniently: match on
the bold label, accept reordering and extra prose around the block. If a fact is
missing, ask the user rather than guessing — an invented target date is worse
than a question.

## If the MCP cannot write the description

Say so plainly, then fall back to a doc on the List named exactly
`Project Details` holding the same block. Tell the user the facts landed in a
doc rather than on the List, because it changes where they look for them.

Skills that read the facts check the List description first, then
`Project Details`.

## Field notes

**Roadmap project** — whether leadership tracks this KE project on the roadmap.
Roadmap projects carry a higher bar: a weekly project update is **required**,
posted to `#project-updates` by the owner. For everything else the weekly update
is optional. Record it plainly as Yes or No — this is the field that decides
whether a missing update is an oversight or a non-event, so it should never be
left blank or guessed.

**Original target** — the committed date. It never changes. Editing it erases
the slip, which is the one thing the weekly update exists to show.

**Current target** — today's best estimate. Changes as often as needed; there is
no judgment in moving it. It is maintained here, and the List's due date is kept
matching it by hand so roadmap views can sort on it.

**Capitalizable** — designated during planning, between Product, Engineering,
and Accounting. `ke-pm` records the designation; it never makes it. If the user
does not know, write `Not yet designated` and tell them to confirm with their
PM. Guessing here produces bad numbers in a finance report months later.

**Full Project Name** — the KE project's full name, written out. The List itself
may be named with a short form so it does not truncate in ClickUp's sidebar, so
this is the only place the full name is recorded outside the Brief. Never leave
it out on the grounds that the List is already named — an abbreviation is not a
name.

**Owner** — who owns this KE project end to end. Defaults to whoever is running
`pm-project-init`, taken from the authenticated ClickUp account and confirmed, not assumed.
Use the name as it appears in ClickUp so it matches the person tasks get
assigned to.

