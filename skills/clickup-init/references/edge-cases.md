# Edge cases — /ke-pm:clickup-init

## The List description already holds the facts

This is an update, not a re-scaffold. Read what is there, show it to the user,
and ask what needs to change. Then rewrite only those lines.

Never rewrite the fact block from scratch: the original target date is in it, and
regenerating quietly resets it to today. That erases every slip the KE project
has accumulated, which is the one thing the weekly update exists to make visible.

## Adopting a List that is already full of tasks

Fine, and common — plenty of KE projects start in ClickUp before anyone runs
`ke-pm`. Adopt it as-is. Do not apply a template to a populated List (it can
disturb existing views and statuses), and do not reorganise the tasks. Record
the facts in the description and stop.

## The user describes something that is not a KE project

Two directions this goes:

**It is really an initiative.** Signs: no end state, months to quarters, spans
several efforts, the name only works as something open-ended like "Improve
onboarding". Say so, and help them find the bounded KE project inside it that
can actually be started.

**It is really a task.** Signs: one person, one deliverable, a couple of days.
It does not need a List, a List description, or a Brief. Tell them to create a task
instead — an unplanned bug or ad-hoc request is a task even with no parent KE
project. Setting up a whole List for it is ceremony that buys nothing.

## The work is too big for one KE project

Steer toward **several KE projects, one List each** — set up the first piece
now, the next when it starts. Steer away from keeping it as one List segmented
with ClickUp Milestone tasks: one List has one due date and one percentage, so
segments hide slips and nothing ever finishes.

Say it once, in a sentence, and give the reason in terms of the weekly update
rather than tidiness. Then let them decide. If they want milestone tasks anyway,
carry on without comment.

Either way you are setting up a single List and treating it as a single KE
project. Do not invent parent-child links between Lists, and do not create
milestone tasks — that is task breakdown, not setup.

## The user wants to set up several KE projects at once

Do them one at a time. Each needs its own name check, its own roadmap call, its
own target dates. Batching produces cards that are half-guessed, and the guesses
are invisible afterwards.

## The user wants the Brief written now, in the same session

Good — that is the intended flow. Finish `clickup-init` first so the facts are
on the List, then invoke `/ke-pm:brief`. Do not write the Brief inside
`clickup-init`; `brief` has an interview to run and rules to apply that do not
belong here.

## The squad is not in the table

Take what the user gives you, record it, and tell them
`references/squads.md` and the playbook's stand-ups page both need
updating. Do not invent a team emoji — a plausible-looking emoji that belongs to
nobody is worse in `#standups` than a missing one.

## No template looks right

Show what you found, say none of them look like a fit, and ask. The user may
know which one is correct, may want the List created bare, or may want to build
a template first. All three are valid. Applying the closest-looking template
because something had to be picked is not.
