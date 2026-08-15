# The Brief template

> Source: kalkomey/playbook — `standards/project-name-and-briefs.md`
> (as of 2026-08-15)

Every KE project's ClickUp List must have a doc named exactly `Brief`. Use these
six `###` headings, in this order. No extra sections, no renamed ones.

Keep `Summary` above the fold — it should be readable the moment the doc opens,
without scrolling.

```markdown
### Summary

[1-2 sentences. Problem + solution + value in one breath. Fits above the fold.]

### Problem

[1 short paragraph. What is broken, missing, or true about the world that makes
this project necessary? Be concise yet specific. Avoid solution language.]

### Goals or Success Metrics

- [1-3 bullet points. Prefer measurable outcomes. Include guardrails if
  applicable, and link to where each metric will be monitored.]

### Users

[1-2 sentences. Who is affected and what matters to them.]

### Approach

[1-3 short paragraphs. What are we building or doing at a high level? This is
not a spec. Use "TBD" if the approach is undetermined when a project is created,
but it should be added when known. If helpful to keep focus, include a short
list of what is out of scope.]

### Open Questions & Risks

- [1-n sentences. What is unresolved or at risk.]
```

Replace the bracketed guidance with finished prose. Never leave brackets in the
published doc.

Open the doc with the **full KE project name** as a heading above `### Summary`:

```markdown
# Address UX issues in HuntWise login flow

### Summary
...
```

The List it lives on is often named with a short form so it does not truncate in
ClickUp's sidebar, so the Brief is one of only two places the full name is
written out — the List description is the other.

## What the Brief is for

It summarises the **problem**, **goals**, and **approach** at a level that stays
useful as the KE project ages — day one through delivery.

It is **not** for execution detail: not how work is sequenced, not who is doing
what this week, not specifics that will change as delivery unfolds. That lives
on the tasks.

## Why it replaces the PRD

- **The right rigor for day one.** Size up the problem, the size of the prize,
  and the shape of the work. Front-loading detail that will shift as you learn
  ossifies wrong assumptions, and then the doc starts fighting reality.
- **Detail lives where the work lives.** User stories, requirements, QA notes,
  mock-ups, technical notes, decisions — these show up on tasks as the KE
  project runs. Doing them up top in a master document duplicates effort and
  drifts from what people actually do in ClickUp.
- **One owner can start.** A credible PRD needs real input from product,
  engineering, and design before it feels done. A name and a Brief are light
  enough that the owner can open the KE project with something useful and pull
  other disciplines in as discovery ramps up.

A big spec as the first artifact is mostly overproduction — detailed
requirements and acceptance criteria produced before the work pulls for them —
and it piles up inventory: documentation that sits "done" but is wrong or unused
once discovery changes the plan.

## Sections that can say TBD

`Approach` and `Open Questions & Risks` do not need to be complete on day one.
They should be filled in early in discovery or execution.

`Summary`, `Problem`, `Goals or Success Metrics`, and `Users` should be real
from the start. If those cannot be answered, the KE project is not ready to
open — that is a finding worth telling the user, not a gap to paper over.

Write `TBD` rather than inventing plausible content. An invented approach reads
exactly like a real one, and nobody downstream can tell the difference.
