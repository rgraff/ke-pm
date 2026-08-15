# Example — Brief from a Slack thread

The golden path: context in, interview, draft, style pass, publish.

---

**User:** `/ke-pm:brief` — here's the Slack thread where we decided to do this
*(pastes 40 messages)*

**Claude:** *(reads the List description)*
> Read the thread and the List description. Before I write anything, some questions.
>
> The thread says people "get stuck" at login. Stuck how — do they fail to sign
> in, or do they sign in and land somewhere unexpected?

**User:** they can't tell which account they have. We have three brands sharing
one auth system and the login page doesn't say which one you're signing into.

**Claude:**
> How do we know that is what is happening — support tickets, session recordings,
> something else?

**User:** support. About 40 tickets a month, all "I can't log in" and it turns
out they're using the right password on the wrong brand.

**Claude:**
> Useful — that is a number we can put in the Brief. Who hits this hardest?
> Someone with accounts on several brands, or new users?

**User:** multi-brand customers. Mostly people who bought a course years ago and
came back for a different state's course.

**Claude:**
> How will we know this worked?

**User:** fewer of those tickets. And we shouldn't make login slower for
everyone else.

**Claude:**
> That is a goal and a guardrail. Where is the ticket volume tracked?

**User:** Zendesk, tagged "login-confusion"

**Claude:**
> Last one — what could make this take much longer than expected?

**User:** the auth service is shared and owned by Platform. We'd need their
sign-off on any change to the login page.

**Claude:**
> I have enough for all six sections. Approach is still open — do you have a
> shape in mind, or should I mark it TBD?

**User:** brand it per-domain, so you see the right logo. But that's not settled.

**Claude:**
> I will write it as the leading candidate and note it is not settled. Writing
> now.

*(drafts the Brief)*

> ### Summary
>
> Customers with accounts on more than one brand cannot tell which brand they
> are signing into, so they use the right password on the wrong site. Branding
> the login page per domain should cut the 40 support tickets we get for this
> each month.
>
> ### Problem
>
> Three brands share one auth system, and the login page looks the same on all
> of them. A customer who bought a course years ago and comes back for a
> different state sees a page that gives no hint which account it wants. They
> enter a password that is correct somewhere else, fail, and open a support
> ticket. Support handles about 40 of these a month, all filed as "I cannot log
> in".
>
> ### Goals or Success Metrics
>
> - Reduce Zendesk tickets tagged `login-confusion` from ~40/month
> - Guardrail: no increase in time to complete login for single-brand customers
>
> ### Users
>
> Customers with accounts on more than one Kalkomey brand — typically returning
> customers taking a course for a second state. They want to get into the course
> they already paid for.
>
> ### Approach
>
> Leading candidate: brand the login page per domain so customers see the logo
> and name of the site they are signing into. Not settled yet.
>
> ### Open Questions & Risks
>
> - The auth service is owned by Platform. Any change to the login page needs
>   their sign-off, and that is not scheduled.
> - We have not confirmed the per-domain approach is the best fix.

**User:** that's good, publish it

**Claude:** *(creates the `Brief` doc)*
> Published: `https://app.clickup.com/…`
>
> `Approach` and `Open Questions & Risks` will firm up as discovery goes. Keep
> the Brief at this level — the implementation detail belongs on the tasks.

---

**What this example shows:**

- "How do we know?" turns a vague complaint into "40 tickets a month".
- The interview finds the guardrail and the metric's home without asking for
  them as a checklist.
- The unsettled approach is written as unsettled rather than as a decision.
- The risk came from asking what could make it take longer, not from a
  risk-brainstorm section.
