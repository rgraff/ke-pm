# Example — the Brief was written first

The Brief already exists in a Google Doc. Setup takes what it gives and asks
only for the rest.

---

**User:** `/ke-pm:clickup-init` — we wrote the brief for the Rangers weather
alerts thing last week, need it in ClickUp now

**Claude:**
> ✅ ClickUp connected as Robert Graff.
> ✅ Slack connected.
>
> Has a Brief been written for this KE project? Paste it or point me at it and I
> will take what I can from it instead of asking you twice.

**User:** *(pastes the doc)*

**Claude:**
> Read it. Here is what I can take from it, and what it does not say.
>
> From the Brief:
> - Name: "Weather alerts for Rangers"
> - Target: end of October
>
> Not in it: owner, whether this is a roadmap project, capitalizable.
>
> Which squad owns it?

**User:** Rangers

**Claude:**
> That squad is called Agency Operations now — same team, and the emoji is still
> `:wg-rangers:` from before the rename. Recording Agency Operations.
>
> Found its Space → Delivery folder, no existing List for this. Before I create
> one, the name.
>
> "Weather alerts for Rangers" reads as a doc title rather than a project name —
> no verb, and the assumed one gives "Build weather alerts for Rangers", which
> works. It is passable. But "alerts" could mean anything from a banner to push
> notifications, and this will show up in reports with no other context.
>
> - **Ship severe-weather push alerts for Rangers**
> - **Build weather alerts for Rangers** (the Brief's name, verb made explicit)

**User:** the first one, it is push notifications

**Claude:**
> KE project name: "Ship severe-weather push alerts for Rangers". At 43
> characters it truncates in the sidebar, so the List needs a short name. Pick
> one or type your own:

*(offers via AskUserQuestion)*

> - `Rangers wx alerts` (17) — leads with the squad
> - `Severe weather push` (19) — leads with the trigger
> - `Rangers push alerts` (19) — leads with the channel

**User:** we say "storm alerts" internally — Rangers storm alerts

**Claude:**
> 21 characters, inside the limit, and it is what people already say. Using it.

**Claude:**
> Templates available: **KE Project — Standard** (`t-901419142237`, expected
> default), Marketing Campaign, Bug Triage. Standard?

**User:** yes

**Claude:** *(creates the List from the template)*
> Now the facts. The Brief says end of October — is 2026-10-31 the committed
> date?

**User:** yes

**Claude:**
> Owner is Robert Graff — right, or someone else?

**User:** Dana owns this one

**Claude:**
> Dana it is. Is this a roadmap project? The Brief does not say, and I do not
> want to guess it from how the doc reads.

**User:** yes

**Claude:**
> Then a weekly update in `#project-updates` is required once work starts.
>
> Capitalizable?

**User:** yes

**Claude:** *(shows the proposed description, gets confirmation, writes it, sets
the due date to 2026-10-31)*
> Facts are on the List: `https://app.clickup.com/…`
>
> Your Brief is not on the List yet. I checked it against the standard: the six
> sections are mostly there, but there is no `Users` section and it has a
> `Background` section that is not part of the template.
>
> If it matched, I would just post it. Since it does not, run `/ke-pm:brief` —
> it will work from what you have written rather than starting over.

**User:** ok, running that next

---

**What this example shows:**

- The Brief is asked for first, before any other question.
- A squad named by its old name is corrected to the current one, with the emoji
  lag explained rather than treated as an error.
- What it yields is played back as facts to confirm, never adopted silently.
- What it does not say is named out loud, so the user can see the gaps.
- The roadmap call is asked even though the Brief reads like an important
  project. It is never inferred.
- The name from the doc gets checked anyway, and the reason is specific.
- The long KE project name is kept, and the List gets a short form so it does
  not truncate — offered as a real choice, with the user's own answer taken
  as-is because it is what the squad already says.
- The existing Brief is checked against the standard, and the two specific
  problems are named. A conforming Brief would have been posted straight to the
  List instead.
