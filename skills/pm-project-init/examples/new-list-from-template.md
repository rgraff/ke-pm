# Example — new KE project, new List

Shows the golden path: both connection checks, name validation before creation,
the handoff that lets the user create the List from the template, and the
roadmap call made explicit.

---

**User:** `/pm-project-init` we're going to fix the login flow on HuntWise

**Claude:**
> ✅ ClickUp connected as Robert Graff.
> ⚠️ Slack is not connected. Nothing in `/pm-project-init` or `/pm-project-brief` needs it,
> so we can carry on — worth sorting before the first weekly update is due.
>
> Which squad owns this KE project?

*(offers the squad list)*

**User:** Huntwise

**Claude:**
> Got it — Huntwise, `:wg-huntwise:`.
>
> I found two Folders in the Huntwise Space that could hold this: **Product
> Delivery** and **Platform**. Which one?

**User:** Product Delivery

**Claude:**
> Before I create the List — "Fix the login flow on HuntWise" is close, but the
> name will appear in reports without the Huntwise folder around it, so it needs
> to stand on its own. Two options:
>
> - **Fix HuntWise login flow**
> - **Address UX issues in HuntWise login flow**
>
> The second is better if the work is about friction rather than something
> broken. Which is closer?

**User:** the second one, it's not broken exactly, people just get stuck

**Claude:**
> "Address UX issues in HuntWise login flow" it is — that is the KE project
> name, and it goes on the Brief and in the List description.
>
> It is 40 characters, which ClickUp truncates to "Address UX issues in Hunt…"
> in every sidebar and picker, so the List itself needs a short name. This is
> what your squad will read every day — pick one, or type your own:

*(offers via AskUserQuestion)*

> - `HW login flow UX` (16) — leads with the brand
> - `HW login friction` (18) — leads with the outcome
> - `HW login page rework` (20) — leads with the surface

**User:** HW login friction

**Claude:**
> Here is the one thing I cannot do for you. The ClickUp MCP has no template
> tools, so I cannot create a List from a template — but it is about thirty
> seconds in the UI:
>
> 1. Open it: https://app.clickup.com/9014033846/home?templateCenter=open&templateId=t-901419142237&templateType=subcategory
> 2. Click **Use template**
> 3. Destination: **team-product** → **Product Delivery**
> 4. Name it exactly: `HW login friction`
>
> If the link does not land on it, it is called **Product Roadmap Project
> Template** — search the template center for that.
>
> Paste the List URL back here when it exists and I will take it from there.

**User:** done — https://app.clickup.com/9014033846/v/li/901412345678

**Claude:** *(fetches the List)*
> Got it. `HW login friction`, in Product Delivery, with the template's statuses
> and views on it. Description is empty, so this is a fresh setup rather than a
> re-run.
>
> Now the facts for the List description. A few things I need.
>
> Owner is Robert Graff — right, or is someone else taking this?

**User:** that's me

**Claude:**
> Is this a roadmap project — one leadership tracks? It decides whether a weekly
> update in `#project-updates` is required or optional.

**User:** yes, it's on the roadmap for Q3

**Claude:**
> Recorded. That means a weekly update is required once work starts.
>
> Two dates next. I cannot read the List's due date — the MCP does not return
> it — so both come from you. What was the original committed target, the one
> agreed at kickoff? It gets recorded once and never changes, which is what keeps
> a slip visible later.

**User:** end of September, say the 30th

**Claude:**
> 2026-09-30 as the original. Is today's estimate still the same date, or has it
> already moved?

**User:** same, we just started

**Claude:**
> Both recorded as 2026-09-30. They will diverge the first time it slips, and
> that gap is what the weekly update reports.
>
> Last one — capitalizable.

*(offers via AskUserQuestion, with the criteria as context)*

> All four have to hold: identifiable and discrete scope, management committed to
> completing it, useful life of 3+ years, tangible future benefit. It is
> designated during planning between Product, Engineering, and Accounting — I do
> not decide it here, and I am not reading it off the roadmap answer either.
>
> - **Yes**
> - **No**
> - **Not yet designated**

**User:** not yet designated

**Claude:**
> Recorded as "Not yet designated" — worth confirming with your PM, since it
> affects the monthly finance report.
>
> Here is the description I will write on the List:

*(shows the proposed description)*

**User:** looks right

**Claude:** *(writes the description)*
> Done.
>
> - List: `https://app.clickup.com/…`
> - Both target dates are in the List description.
>
> One thing I could not do: set the List's due date to 2026-09-30. The MCP can
> neither read nor write that field — please set it by hand in List Info. Every
> roadmap view in the workspace sorts and filters on it, so a List without one
> goes missing from them.
>
> One more thing, which I cannot do for you: set up a Claude Project for this KE
> project. In Claude, **Projects** → **New project**, named "Address UX issues in
> HuntWise login flow" to match the List. Put the List URL in its knowledge along
> with whatever you are working from — support tickets, notes, transcripts.
>
> Then run the `ke-pm` commands from inside it. They read the facts from
> ClickUp either way, but the extra context makes the Brief better. Keep
> decisions flowing back to ClickUp though — one that only exists in a Claude
> conversation is invisible to the squad.
>
> There is no Brief yet, and the KE project is not ready to work until it has
> one.

*(offers via AskUserQuestion)*

> Ready to draft the Brief now?
>
> - **Yes, start it**
> - **Not now**

**User:** yes, start it

**Claude:** *(invokes `pm-project-brief` via the Skill tool)*

---

**What this example shows:**

- Slack missing is a warning, and the skill keeps going.
- The roadmap question is asked plainly, and its consequence is stated when the
  answer comes back — not left for the user to discover in a month.
- The name gets fixed *before* the List exists.
- The KE project name and the List name are settled separately, with the reason
  for the short form stated rather than silently applied.
- Claude does not create the List. It hands over the template link, the
  destination, and an exact name in one message, then stops — rather than
  creating a template-less List and leaving the user to clean it up.
- The pasted URL is resolved and checked — right name, right Folder, template
  visibly applied, description empty — before anything gets written.
- The template is given twice: as a link that opens it, and by name in case the
  link misfires. One round trip saved for the cost of one sentence.
- The original is asked for before the current one, and both are recorded —
  identical at kickoff, which is the point: they diverge on the first slip.
  Asking for "the target date" in one question gets today's estimate and loses
  the commitment.
- The one thing the MCP could not do — set the due date — is stated as an action
  for the user, with the reason, rather than buried or skipped.
- Capitalizable is a real question with the four criteria attached, and "not yet
  designated" is a first-class answer rather than a failure to decide. It is not
  inferred from the roadmap answer — that is a different question.
- Nothing is asked about the template. Claude cannot verify it, so it is not
  recorded and not confirmed.
- The Brief is offered and started, not named and left. The session already holds
  the context it needs.
