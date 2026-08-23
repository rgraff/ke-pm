# Edge cases — /ke-pm:pm-project-init

## The List description already holds the facts

This is an update, not a re-scaffold. Read what is there, show it to the user,
and ask what needs to change. Then rewrite only those lines.

Never rewrite the fact block from scratch: the original target date is in it, and
regenerating quietly resets it to today. That erases every slip the KE project
has accumulated, which is the one thing the weekly update exists to make visible.

## Adopting a List that is already full of tasks

Fine, and common — plenty of KE projects start in ClickUp before anyone runs
`ke-pm`. Adopt it as-is. Do not reorganise the tasks, and do not suggest
applying the template to it — on a populated List that can disturb existing
views and statuses, and the tasks are already there under whatever structure the
squad has been using. Record the facts in the description and stop.

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

Good — that is the intended flow. Finish `pm-project-init` first so the facts are
on the List, then invoke `/ke-pm:pm-project-brief`. Do not write the Brief inside
`pm-project-init`; `pm-project-brief` has an interview to run and rules to apply that do not
belong here.

## The squad is not in the table

Take what the user gives you, record it, and tell them
`references/squads.md` and the playbook's stand-ups page both need
updating. Do not invent a team emoji — a plausible-looking emoji that belongs to
nobody is worse in `#standups` than a missing one.

## The user cannot find the template

Claude cannot see the picker, so take their word for it. The template may not be
shared with their account, or they may be on mobile where the template center is
harder to reach.

Offer the bare-List fallback and let them pick: Claude creates it with the right
name in the right Folder, they apply the template later. Record
`Template applied: none (apply manually)` either way — that line is the only
trace that the List is incomplete.

If the template is missing for everyone rather than just this user, say it once.
A deleted or unshared template fails the same way for every KE project set up
after this one, and the person setting one up is the only one positioned to
notice.

## The user comes back with a List they already created

Common, and fine — someone reads the handoff message, makes the List, and starts
a fresh session before pasting the URL back. Take the URL, resolve it, and run
the checks in `creating-the-list.md`. If the description already holds a fact
block, this is an update rather than a fresh setup; see the top of this file.

Do not insist on re-walking the naming steps for a List that already exists. If
the name breaks the rules in `naming-rules.md`, say so once and let them decide
whether renaming is worth it.
