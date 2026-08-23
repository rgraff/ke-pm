# Troubleshooting — /ke-pm:pm-project-init

Symptom → what is actually happening → what to do.

---

**`ToolSearch "+clickup"` returns nothing.**
Either the server is registered but not authorized — the usual case, since the
plugin ships its own `.mcp.json` as `plugin:ke-pm:clickup` — or it is not
configured at all, which only happens when running without the plugin installed.
Give the user the `/mcp` test from `connections.md` so they can tell which, and
stop the skill. Do not continue without ClickUp.

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

**You cannot find a tool to enumerate or apply List templates.**
There is not one. The ClickUp MCP server exposes no template tools — this is
expected, not a misconfiguration, and no amount of `ToolSearch` will turn one up.
Do not work around it by creating the List bare. Hand creation to the user as
described in `creating-the-list.md`. (If a future version of the server adds
template tools, that whole handoff should be deleted.)

---

**The template link does not open the right template, or opens nothing.**
ClickUp changes its web app without notice, and the template center URL is not a
documented interface. Do not debug it and do not try variations. Tell the user
to open the template center themselves and search **Product Roadmap Project
Template** — that is why the name goes in the handoff alongside the link. If the
name turns up nothing either, the template may have been renamed, deleted, or
unshared; see `edge-cases.md`.

---

**The user pasted something that is not a List URL.**
Look for a numeric ID after `/v/li/` or `/v/l/`; ClickUp appends view IDs and
query strings, so trailing junk is normal. If there is no numeric ID in it, they
have probably pasted a Folder, a task, or a view. Say what you got, and ask them
to open the List itself and copy from the address bar. Never guess an ID, and
never fall back to searching by name — landing on a similarly named List and
writing facts to it is worse than asking again.

---

**The List the user pasted is in a different Folder than the one confirmed.**
Say so before writing anything. It is empty now, so moving it costs nothing;
after the facts and the Brief land it shows up wrong in rollups until someone
notices. Ask whether to keep it where it is or move it.

---

**A List with a very similar name already exists.**
Stop and show it. Two Lists for one KE project split its tasks, and the weekly
update's percentage silently reports on half the work. Ask whether to adopt the
existing List instead.

---

**The List description already holds the facts.**
This is a re-run, not a fresh setup. See `edge-cases.md`.

---

**You cannot read or set the List's due date.**
Expected, in both directions, and worth knowing before you promise anything:

- `clickup_update_list` accepts `name`, `content`, and `status`. No `due_date`.
  The parameter exists only on `clickup_create_list`, at creation time, and
  `pm-project-init` does not create Lists.
- `clickup_get_list` returns id, name, content, space, url, and statuses. **No
  dates.** There is no way to see what the due date currently says.

Same MCP gap as the missing template tools: ClickUp's REST API supports both
(`PUT /api/v2/list/{list_id}` takes `due_date`), the server does not expose them.

So do not retry, and do not design around reading it. The List description is the
only date record available — both target dates go there, and the due date is
something you ask the user to set by hand. Say why it matters: every roadmap view
in the workspace sorts and filters on that field, and `/ke-pm:update` maintains
it as the current target from then on.

Never report the due date as set, and never say it "already matches" — you cannot
see it. If the user says it is set to something else, theirs is the truth and the
description follows it.

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

