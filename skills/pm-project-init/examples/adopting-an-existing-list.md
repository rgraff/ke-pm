# Example — adopting an existing List

The KE project already lives in ClickUp with tasks on it. `pm-project-init` records the
facts and touches nothing else.

---

**User:** `/pm-project-init` — the Rangers offline maps project is already in ClickUp,
I just want the facts recorded on it

**Claude:**
> ✅ ClickUp connected as Robert Graff.
> ✅ Slack connected.
>
> Found one List that matches in the Rangers Space → Delivery folder:
> **Ship offline maps for Rangers** — 34 tasks, 12 closed. Is that the one?

**User:** that's it

**Claude:**
> Adopting it as-is — tasks stay where they are, and I am not going to suggest
> applying a template to a populated List. The description has no facts on it
> yet, and there is no `Brief` doc. I cannot see the List's due date — the MCP
> does not return it — so I will ask for the dates rather than assume.
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
> Nothing is recorded on this List yet, so start with the original: what date was
> committed at kickoff?

**User:** it was supposed to be July 31 but we're looking at mid-September now

**Claude:**
> So original **2026-07-31**, current **2026-09-15**. I record both — the
> original never moves, so the six-week slip stays visible in the weekly update
> instead of quietly disappearing.
>
> Set the List due date to 2026-09-15 yourself. I can neither read nor write that
> field, and every roadmap view in the workspace sorts on it.
>
> Last one — capitalizable.

*(offers via AskUserQuestion, with the four criteria as context)*

**User:** yes, it was designated at planning

**Claude:** *(shows the proposed description, gets confirmation, writes it)*
> Facts recorded on the List: `https://app.clickup.com/…`
>
> There is no `Brief` on this List. Since the KE project is already running, the
> Brief will ask what you understood the problem to be at the start — worth doing
> while people still remember.

*(offers via AskUserQuestion)*

> Ready to draft the Brief now?
>
> - **Yes, start it**
> - **Not now**

**User:** not now, I need to pull up the original thread

**Claude:**
> Fine — `/pm-project-brief` is there when you have it.

---

**What this example shows:**

- A populated List gets adopted, not restructured, and the template is left
  alone.
- The original target stays at the missed date. This is the single most
  important behaviour in `pm-project-init`: regenerating it to today would erase the slip.
- Existing docs are checked for before anything is written.
- A late Brief is still worth writing, and the skill says why.
