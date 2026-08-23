# Example — adopting an existing List

The KE project already lives in ClickUp with tasks on it. `pm-project-init` records the
facts and touches nothing else.

---

**User:** `/ke-pm:pm-project-init` — the Rangers offline maps project is already in ClickUp,
I just want the facts recorded on it

**Claude:**
> ✅ ClickUp connected as Robert Graff.
> ✅ Slack connected.
>
> Found one List that matches in the Rangers Space → Delivery folder:
> **Ship offline maps for Rangers** — 34 tasks, 12 closed. Is that the one?

**User:** that's it

**Claude:**
> Adopting it as-is. It already has tasks, so I will not apply a template —
> that can disturb existing views and statuses. The description has no facts on
> it yet, and there is no `Brief` doc.
>
> Squad is Agency Operations, `:wg-rangers:` — correct? The emoji still says
> "rangers" from before the rename; that is expected.

**User:** yes

**Claude:**
> Is this a roadmap project?

**User:** yes

**Claude:**
> Then a weekly update in `#project-updates` is required — worth checking one
> has been going out, since this has been running a while.
>
> Original target date — the committed one?

**User:** it was supposed to be July 31 but we're looking at mid-September now

**Claude:**
> Then original stays **2026-07-31** and projected becomes **2026-09-15**. The
> original never moves, so the six-week slip stays visible in the weekly update
> instead of quietly disappearing.
>
> Capitalizable?

**User:** yes, it was designated at planning

**Claude:** *(shows the proposed description, gets confirmation, writes it)*
> Facts recorded on the List: `https://app.clickup.com/…`
>
> There is no `Brief` on this List. Since the KE project is already running,
> `/ke-pm:pm-project-brief` will ask what you understood the problem to be at the start —
> worth doing while people still remember.

---

**What this example shows:**

- A populated List gets adopted, not restructured, and no template is applied.
- The original target stays at the missed date. This is the single most
  important behaviour in `pm-project-init`: regenerating it to today would erase the slip.
- Existing docs are checked for before anything is written.
- A late Brief is still worth writing, and the skill says why.
