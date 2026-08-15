# Troubleshooting — /ke-pm:brief

Symptom → what is actually happening → what to do.

---

**The List exists but has no facts on it.**
`/ke-pm:clickup-init` has not been run for this KE project. Do not stop, and do
not reconstruct the facts by asking — the roadmap call and the capitalizable
designation are decisions, not trivia, and `clickup-init` asks them properly.
Write the Brief, mention `/ke-pm:clickup-init` once, and move on.

---

**No ClickUp List for this KE project at all.**
Fine — the Brief often comes first. Run the interview from a blank page and
handle the landing in step 6: offer `/ke-pm:clickup-init`, and if the user is
not ready for that, hand them the markdown rather than writing it anywhere.

---

**Cannot find the List from what the user gave you.**
Search on the name, show near matches, and ask. If two Lists look like the same
KE project, stop and raise it — duplicate Lists split the tasks and quietly
corrupt the weekly update's percentage.

---

**A `Brief` doc already exists.**
This is an update. Read it first, show what is changing, and get confirmation
before writing. Never overwrite silently; someone else may have edited it.

---

**The user wants the Brief written immediately, without the interview.**
Say why the interview exists — a Brief written from a template rather than a
conversation reads fine and says nothing — and offer the short version: Problem,
Goals, Users, in three questions. If they still decline, draft from what you
have and mark every gap `TBD`. Do not invent content to fill the shape.

---

**The user keeps answering with solutions instead of problems.**
Work backwards. "If that existed, what would be different for a user?" Then
write that as the `Problem` and keep the original suggestion for `Approach`.

---

**Nobody can name a success metric.**
Do not invent one. Write what they actually said, and put the missing metric in
`Open Questions & Risks`. A fabricated metric gets quoted back in a leadership
review months later as though someone chose it.

---

**The draft is drifting into a spec.**
Cut it back to the high-level shape and tell the user where the detail goes:
onto the tasks, as user stories, requirements, QA notes, and technical notes.
This is the most common way a Brief goes wrong.

---

**The ClickUp write fails.**
Report the exact error. Keep the full draft visible in the conversation so
nothing the user worked through is lost, and offer to retry. If it is a
permissions error, retrying will not help — ask them to check their ClickUp
access.

---

**The user pastes a PRD and asks you to convert it.**
See `edge-cases.md`. Short version: mine it for the six sections and leave the
rest behind.
