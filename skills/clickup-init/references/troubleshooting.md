# Troubleshooting — /ke-pm:clickup-init

Symptom → what is actually happening → what to do.

---

**`ToolSearch "+clickup"` returns nothing.**
The MCP server is not configured for this directory, or Claude Code has not been
restarted since it was added. Give the user the `.mcp.json` block from
`connections.md` and stop the skill. Do not continue without ClickUp.

---

**ClickUp tools exist but every call fails with a permissions or auth error.**
The server is reachable; the account behind it is not authorised for this
workspace or has not completed OAuth. Report the exact error text — do not
paraphrase it into something vaguer. Ask the user to re-authorise the ClickUp
connection, then stop. Retrying the same call will not help.

---

**Cannot find a Space or Folder for the squad.**
Either the squad's work lives somewhere unexpected, or the account's ClickUp
access does not include it. Show the Spaces you can see and ask the user where
this KE project belongs. Never create a Space or Folder to resolve this — that
is a workspace-structure decision, not a setup step, and a stray Space is worse
than a missing one.

---

**Several Folders look plausible.**
Show all of them with their paths and ask. A List in the wrong Folder is
annoying to move and shows up wrong in rollups until someone notices.

---

**The MCP cannot enumerate List templates.**
Say so plainly. Create the List without a template, tell the user to apply
template `t-901419142237` through the ClickUp UI, and record
`Template applied: none (apply manually)` in the List description. Do not skip
silently — an untemplated List looks correct until someone needs a view that is
not there.

---

**Template application fails after the List was created.**
The List exists; do not delete it and do not create a second one. Report what
happened, point the user at the ClickUp UI to apply the template, and carry on
with recording the facts.

---

**A List with a very similar name already exists.**
Stop and show it. Two Lists for one KE project split its tasks, and the weekly
update's percentage silently reports on half the work. Ask whether to adopt the
existing List instead.

---

**The List description already holds the facts.**
This is a re-run, not a fresh setup. See `edge-cases.md`.

---

**The user does not know the original target date.**
Do not invent one and do not leave it blank — the weekly update's header math
depends on it. Ask for their best committed date and record it. If they truly
cannot commit yet, record `TBD` and tell them plainly that `/ke-pm:update` will
not be able to report a slip until it is filled in.

---

**The user does not know whether the KE project is capitalizable.**
Record `Not yet designated` and tell them to confirm with their PM. Never guess.
The designation is a finance decision made between Product, Engineering, and
Accounting.

