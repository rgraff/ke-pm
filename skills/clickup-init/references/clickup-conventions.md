# ClickUp conventions

> Source: kalkomey/playbook — `processes/organizing-tasks-in-clickup.md`,
> `processes/work-hierarchy.md`, `standards/project-name-and-briefs.md`
> (as of 2026-08-15)

## How work maps to ClickUp

| Playbook level | In ClickUp |
|---|---|
| **KE project** | **A List** |
| Task | A task on that List |
| Multiple PRs for one task | Subtasks, one PR each |

A KE project is one List. There is no fourth level — no workstreams, no themes,
no epics-as-a-structure. If something does not fit, the work gets reframed
rather than given a new bucket.

## Milestones: steer away from them

When a piece of work is too big for one KE project, there are two shapes. They
are not equally good, and the skills should say so.

**Prefer this:** split it into **several KE projects, one List each**. The
umbrella they belong to has no object in ClickUp — it lives in people's heads,
or, when it is genuinely that big, as an initiative — which `ke-pm` does not
record yet.

**Steer away from this:** keeping it as one KE project and using ClickUp's
**Milestone** task type to group the tasks into segments.

### Why

- **A KE project is supposed to have a legible end.** Segments inside one List
  push the finish line months out, and a KE project that never finishes is one
  nobody can report on honestly.
- **Percent complete stops meaning anything.** The weekly update reports done
  tasks over total tasks for the List. On a List covering four milestones, "31%
  complete" says nothing about whether the milestone due next week will land.
- **Dates cannot move independently.** One List has one due date. When the third
  segment slips, either the whole KE project's date moves — overstating the
  damage — or the slip stays invisible until it is late.
- **Nothing ships.** Separate KE projects finish, get their percentage to 100,
  and clear out of the roadmap view. Segments inside a List just accumulate.

### How to say it

Once, plainly, without lecturing:

> That sounds like more than one KE project. I would set up the first piece now
> with its own List, and the next one when it starts — separate Lists mean each
> piece gets its own dates, its own percentage, and can finish. ClickUp
> milestones inside one List would work, but the weekly update gets much harder
> to read.

Then let them decide. If they want milestone tasks anyway, that is their call —
say nothing further and carry on. It is still one List and one KE project as far
as every skill is concerned.

### Either way, nothing special to handle

Whatever you are working on is **a single ClickUp List and a single KE
project**. A KE project split off from something larger is just a KE project: it
gets a name, facts, and a Brief like any other, and owes nothing extra. No
parent-child linking between Lists, no rolled-up reporting, no
milestone-specific fields. `clickup-init` never creates milestone tasks.

> The playbook's `organizing-tasks-in-clickup.md` describes the Milestone task
> type as the way to segment a large project. Preferring separate KE projects is
> the newer practice and the page has not caught up.

## Discovery, not hardcoded IDs

Never hardcode a Space ID, Folder ID, or List ID. Find them through the ClickUp
MCP at runtime and confirm the destination with the user before creating
anything.

Workspace structure changes. A skill that hardcodes today's Folder breaks
silently the first time someone reorganises a Space, and the failure looks like
a Claude problem rather than a moved folder.

If several Spaces or Folders look plausible for the squad, show what you
found and ask. Do not guess.

## List templates

Always discover and always show. Enumerate the workspace's available List
templates through the ClickUp MCP, display the candidates by name, and let the
user choose.

The expected default is template `t-901419142237`. When it appears in the
discovered list, mark it as the expected choice — but still show the full list,
and still let the user pick something else. Never apply a template the user has
not seen.

If the MCP cannot enumerate or apply templates:

1. Say so plainly — do not pretend it worked.
2. Create the List without a template.
3. Tell the user to apply the template through the ClickUp UI.
4. Record `Template applied: none (apply manually)` in the List description.

A silently template-less List looks identical to a correct one until someone
needs a view that is not there.

## Where things are written on a List

| What | Where | Written by |
|---|---|---|
| The KE project's facts | The List **description**, plus the List **due date** for the projected target | `/ke-pm:clickup-init` |
| Problem, goals, approach | A doc named exactly `Brief` | `/ke-pm:brief` |

`ke-pm` creates exactly one document, the `Brief`. The facts go on the List
itself rather than into a second doc — a document that exists only so the
tooling can read it back is clutter in a place meant for team documents.

The `Brief` name matters: later skills find it by name. Not `Brief.md`, not
`Project Brief`.

Never overwrite a description or a doc without showing the user what changes
first. These are team documents; someone else may have edited them since.

## What does not go in ClickUp

Durable process documentation belongs in the playbook. Shipped product
documentation belongs with the product's source repo. ClickUp holds delivery
artifacts for work in progress — which is exactly what the KE project's facts and
its Brief are.
