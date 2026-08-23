# Example — updating a stale Brief

A Brief exists and reality has moved. The update is surgical and visible.

---

**User:** `/ke-pm:pm-project-brief` — the brief on the checkout project is out of date, we
changed approach

**Claude:** *(reads the List description and the existing `Brief`)*
> Read the current Brief. It says the approach is to build native in-app
> checkout, and lists "payment provider not chosen" as an open question.
>
> What changed?

**User:** we picked Stripe, and we're doing web-only for now — native is pushed
to Q4.

**Claude:**
> That touches three sections. Here is what I would change, leaving the rest
> alone:
>
> **`Approach`** — currently:
>
> > Build native in-app checkout for iOS and Android, backed by a payment
> > provider to be selected.
>
> becomes:
>
> > Ship web checkout using Stripe. Native in-app checkout is out of scope for
> > this KE project and is planned for Q4.
>
> **`Open Questions & Risks`** — drop "payment provider not chosen", since it is
> answered.
>
> **`Summary`** — currently says "in-app checkout"; needs to say web checkout so
> the first line is not contradicted three sections later.
>
> `Problem`, `Goals or Success Metrics`, and `Users` look unaffected — the
> problem did not change, only the shape of the fix. Agree?

**User:** yes, but add that we might need to revisit if the App Store rules
change

**Claude:**
> Adding to `Open Questions & Risks`:
>
> > If App Store payment rules change, the web-only decision may need revisiting.
>
> Apply these four edits?

**User:** go

**Claude:** *(updates the doc)*
> Updated: `https://app.clickup.com/…`
>
> The deferral of native checkout is a decision worth surfacing in this week's
> project update under Artifacts.

---

**What this example shows:**

- The existing Brief is read first and the changes are shown before anything is
  written.
- Only affected sections change; the untouched ones are named so the user knows
  they were considered rather than missed.
- The `Summary` gets fixed too — the most commonly missed edit, and the one that
  makes a Brief self-contradictory.
- The answered open question is removed rather than left to rot.
