# Interview guide

> Source: kalkomey/playbook — `standards/project-name-and-briefs.md`
> (as of 2026-08-15)

The playbook's instruction is blunt: **do not write the Brief until the user
says to start.** Review what they give you, then ask questions until you have
what you need for a complete, accurate draft.

You get a better Brief when the gaps get filled before writing, not after.

## Working from the material they gave you

Read everything supplied in step 2 before the first question. The interview is
for what the material does not answer — asking someone what the problem is when
they just pasted a thread describing it is how a skill loses their attention.

Quote it back when you use it: "the thread says support is seeing this a few
times a week — is that still roughly right?" It shows the material was read, and
it catches the ones that have gone stale.

Watch for the gap between what a document claims and what a person says. A deck
written to win approval and a support queue rarely tell the same story, and the
difference is usually the real problem.

If a transcript or ticket export carries customer names, contact details, or
anything else personal, do not copy it into the Brief. Summarise the pattern
instead — the Brief needs "returning multi-brand customers", not a name.

## How to run it

**One question at a time.** Let each answer shape the next one. A numbered list
of eight questions gets eight short answers; a conversation gets the real story.

**Follow what is interesting.** If an answer contains something surprising or
contradictory, chase it. That is usually where the actual problem is.

**Ask for evidence, gently.** "How do we know that?" and "where did that number
come from?" are the two most useful questions here. They separate what someone
has seen from what someone assumes.

**Stop when you can fill the sections honestly** — not when you can fill them
plausibly. Then say what you have, name what is still missing, and ask whether
to write it up.

## What each section needs

**Summary** — falls out of the others. Do not ask for it directly.

**Problem** — what is broken, missing, or true about the world that makes this
KE project necessary. Good questions:
- What is happening today that should not be?
- Who is running into this, and how often?
- How do we know — a metric, a support queue, a specific customer?
- What happens if we do nothing?

Push back when the answer is a solution. "We need a new onboarding flow" is not
a problem; "new users cannot tell which course they signed up for" is.

**Goals or Success Metrics** — one to three, measurable where possible:
- How will we know this worked?
- What number should move, and where is it monitored?
- Is there anything that must *not* get worse? (guardrails)

If nobody can name a metric, say so in the Brief rather than inventing one.

**Users** — who is affected and what matters to them:
- Who feels this problem most?
- What are they trying to get done when they hit it?
- Beginners or experts? The audience runs from one to the other, and the answer
  usually changes the work.

**Approach** — high level, not a spec:
- What is the shape of the fix?
- Is anything explicitly out of scope?
- Is this a new pattern, or does it follow something we have already built?

`TBD` is a legitimate answer at kickoff. Take it.

**Open Questions & Risks** — what is unresolved:
- What could make this take twice as long?
- What are we assuming that we have not checked?
- Is anything blocked on another team or a decision that has not been made?

If the user says there are no risks, ask what would have to be true for this to
slip a month. That question almost always produces one.

## Signals to redirect

**They hand you a solution and no problem.** Work backwards: what would be
different for a user if this existed? Then write that as the problem.

**Every answer is abstract.** Ask for one specific instance. "Tell me about the
last time this happened to a real customer." Abstraction is usually a sign the
problem has not been examined, not that it is broad.

**They want to specify the build.** Take the detail, keep the high-level shape
for `Approach`, and tell them the rest belongs on the tasks where it can change
as they learn.

**They cannot answer Problem, Goals, or Users at all.** The KE project may not
be ready to open. Say so plainly. That is a useful finding, not a failure of the
interview.
