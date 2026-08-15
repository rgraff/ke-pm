# Glossary

Three different things get called "project". This repo never uses the bare word
on its own — in skill prose, in questions to the user, or in generated
documents. Say which one you mean.

- **KE project** — A project as the Kalkomey playbook defines it: time-bound,
  defined scope, an expected delivery window, one owner. Sits between an
  initiative (why) and a task (how and now). This is the unit `ke-pm` works on.

- **ClickUp List** — Where a KE project lives in ClickUp: a List, with its
  views, statuses, and tasks. One KE project maps to exactly one List. When a
  skill says "the List" it means this. This may be called a ClickUp project.

- **Claude Project** — A project inside Claude holding the working context for
  one KE project: transcripts, research notes, drafts. `ke-pm` skills are meant
  to be run from inside one, but they store nothing there — no skill can write
  to a Claude Project, and nothing of record belongs in one. ClickUp holds the
  record; the Claude Project is the workbench.

Other terms used across the skills:

- **The KE project's facts** — Owner, squad, original target,
  and capitalizable designation. `/ke-pm:clickup-init` records them in
  the ClickUp List's own **description**, and puts the projected target in the
  List's **due date**. There is no separate document: the facts live on the List,
  where the whole team can see them. Every later skill reads them from there.

- **Milestone** — A segment of a large piece of work. `ke-pm` steers away from
  ClickUp's Milestone task type: when work is too big for one KE project, the
  preferred shape is **several KE projects, one List each**, so every piece has
  its own dates, its own percentage, and can actually finish. The umbrella has no
  object in ClickUp. Either way a skill sees a single List and treats it as a
  single KE project, with nothing extra owed.

- **Roadmap project** — A KE project that leadership tracks on the roadmap. It
  carries a higher bar of diligence, and a **weekly project update** posted to
  `#project-updates` by its owner is required. Every other KE project is a normal
  one, where the weekly update is optional. Recorded in the List description at
  setup, because it determines what is owed later.

- **Brief** — A doc on the ClickUp List summarising the problem, goals, and
  approach. Written by `/ke-pm:brief`. Every KE project must have one. It
  replaces the PRD; it is not a spec.

- **Capitalizable** — Whether the KE project's development costs can be recorded
  as a capital asset. Designated during planning between Product, Engineering,
  and Accounting — `ke-pm` records the designation, it does not make it.

- **Squad** — The team the KE project belongs to. Determines the team emoji that
  leads Slack posts in later skills. Previously called a *working group* — the
  playbook, and the `:wg-*:` Slack emoji names, still use the old term. Say
  squad; leave the emoji names alone.
