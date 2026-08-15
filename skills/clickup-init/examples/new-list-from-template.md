# Example — new KE project, new List

Shows the golden path: both connection checks, name validation before creation,
template discovery, and the roadmap call made explicit.

---

**User:** `/ke-pm:clickup-init` we're going to fix the login flow on HuntWise

**Claude:**
> ✅ ClickUp connected as Robert Graff.
> ⚠️ Slack is not connected. Nothing in `/ke-pm:clickup-init` or `/ke-pm:brief` needs it,
> so we can carry on — but `/ke-pm:update` and `/ke-pm:standup` will not be able
> to post when they arrive.
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
> - `HW login page fix` (17) — leads with the surface

**User:** HW login friction

**Claude:**
>
> Available List templates in the workspace:
>
> 1. **KE Project — Standard** (`t-901419142237`) — expected default
> 2. Marketing Campaign
> 3. Bug Triage
>
> Use the standard one?

**User:** yes

**Claude:** *(creates the List, applies the template)*
> Created. Now the facts for the List description. A few things I need.
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
> What is the original target date — the committed one? It gets recorded once
> and never changes, so a slip stays visible later.

**User:** end of September, say the 30th

**Claude:**
> 2026-09-30, projected the same for now.
>
> Is this KE project capitalizable?

**User:** not sure

**Claude:**
> Recording "Not yet designated" — worth confirming with your PM, since it
> affects the monthly finance report.
>
> Here is the description I will write on the List:

*(shows the proposed description)*

**User:** looks right

**Claude:** *(writes the description, sets the List due date to 2026-09-30)*
> Done.
>
> - List: `https://app.clickup.com/…`
> - Facts are in the List description; projected target is the List due date.
>
> One more thing, which I cannot do for you: set up a Claude Project for this KE
> project. In Claude, **Projects** → **New project**, named "Address UX issues in
> HuntWise login flow" to match the List. Put the List URL in its knowledge along
> with whatever you are working from — support tickets, notes, transcripts.
>
> Then run the `/ke-pm:*` commands from inside it. They read the facts from
> ClickUp either way, but the extra context makes the Brief better. Keep
> decisions flowing back to ClickUp though — one that only exists in a Claude
> conversation is invisible to the squad.
>
> Next: `/ke-pm:brief`. The KE project is not ready to work until it has one.

---

**What this example shows:**

- Slack missing is a warning, and the skill keeps going.
- The roadmap question is asked plainly, and its consequence is stated when the
  answer comes back — not left for the user to discover in a month.
- The name gets fixed *before* the List exists.
- The KE project name and the List name are settled separately, with the reason
  for the short form stated rather than silently applied.
- The template list is shown even though a default exists.
- "Not sure" about capitalizable is recorded honestly, not guessed.
