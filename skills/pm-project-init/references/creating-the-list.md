# Creating the List

> **MCP deficiency.** The ClickUp MCP server exposes no template tools. There is
> no way to enumerate List templates and no way to create a List from one. The
> two creation tools it does expose — `clickup_create_list` and
> `clickup_create_list_in_folder` — take a name, a folder or space, a
> description, and a status. No template parameter, and no separate apply-template
> call to follow up with.
>
> This is a gap in the MCP server, not in ClickUp. The REST API has supported it
> for years: `GET /api/v2/team/{team_id}/list_template` enumerates them and
> `POST /api/v2/folder/{folder_id}/list_template/{template_id}` creates from one.
> Reaching those directly would mean a ClickUp API token, which the MCP's OAuth
> connection does not hand out, plus shell access this skill does not have.
>
> So the List gets created by the user, in the ClickUp UI, and this skill picks
> it up afterwards. **When ClickUp adds template tools to their MCP server,
> collapse this whole file back into a single tool call in step 5** — see
> `clickup-conventions.md`, which carries the same note.

---

## The shape of it

Claude cannot create the List correctly, so it does not create the List at all.
It hands the user everything needed to do it in one pass, waits, and takes the
URL back.

1. Give the user a link straight to the template, the destination Folder by
   name, and the exact List name to type.
2. They create the List.
3. They paste the URL back.
4. Claude resolves the URL, confirms it is the right List, and checks whether it
   has already been initialized.

Never create the List with `clickup_create_list_in_folder` as a shortcut. A
template-less List looks identical to a correct one until someone needs a view
that is not there, and it leaves the user with a name collision to clean up
before they can create the real one. Creating bare is a fallback the user
chooses, not one you take on their behalf — see **When the user cannot use the
template** below.

## Build the link

ClickUp's template center opens directly from a URL, with a specific template
already selected. That link is the whole handoff — it drops the user on the
right template with a **Use template** button, rather than asking them to find it
in a picker.

```
https://app.clickup.com/{workspace_id}/home?templateCenter=open&templateId={template_id}&templateType=subcategory
```

- `{workspace_id}` — the `root` id from `clickup_get_workspace_hierarchy`. The
  Workspace, not the Space.
- `{template_id}` — `t-901419142237` unless the user has chosen otherwise. That
  is **Product Roadmap Project Template**, the standard one.
- `templateType=subcategory` — leave it exactly as written. ClickUp calls a List
  a "subcategory" internally; this is what makes it open as a **List** template
  rather than a Folder or Space one.

For the standard template in the Kalkomey workspace, that resolves to:

```
https://app.clickup.com/9014033846/home?templateCenter=open&templateId=t-901419142237&templateType=subcategory
```

The link selects the template but not the destination — **Use template** asks
where the List goes. So the Folder confirmed in step 4 still has to be named in
words, by Space and Folder, or the user is guessing at a picker.

## What to send

One message, everything in it. The user is about to leave the conversation and
do something in another tab — anything you leave out costs a round trip.

> I cannot create a List from a template — the ClickUp MCP has no template tools
> yet. This link does most of it though:
>
> 1. Open it: https://app.clickup.com/9014033846/home?templateCenter=open&templateId=t-901419142237&templateType=subcategory
> 2. Click **Use template**
> 3. Destination: **team-product** → **wg-huntwise**
> 4. Name it exactly: `HW login friction`
>
> If the link does not land on it, it is called **Product Roadmap Project
> Template** — search the template center for that.
>
> Then paste the List URL back here and I will pick it up from there.

Five things, always:

- **The template link**, built as above, so they land on the right template with
  nothing to search for.
- **The template's name** — **Product Roadmap Project Template** — as the
  fallback, so a link that misfires costs nothing.
- **The destination**, named as Space → Folder, because the link cannot carry it.
- **The exact List name**, already settled, in backticks so it can be copied
  without picking up a stray space.
- **The ask to paste the URL back**, so they know the conversation resumes.

Then stop and wait. Do not carry on to the facts while they are gone — the facts
get written to a List that does not exist yet.

## Naming the template

The standard template is **Product Roadmap Project Template**, ID
`t-901419142237`. Give both. The link does the work when it works, and the name
is what the user needs the moment it does not — a bare ID is useless in the
template center, which lists templates by name and offers a search box.

So the handoff always says the name, not just "the standard template". If the
link opens the template center empty, on the wrong template, or not at all, they
can search **Product Roadmap Project Template** and carry on without coming back
to ask.

Record it in the List description's `Template applied:` line. The MCP cannot read
which template a List was built from, so that line is the only place the name
survives between sessions. Write what they actually used — if they say they
picked something else, record that instead of the default.

## Taking the URL back

The user pastes something like:

```
https://app.clickup.com/9014033846/v/li/901412345678
```

The last path segment is the List ID. Accept the other shapes too — ClickUp
appends view IDs and query strings, and users paste from the address bar:

- `…/v/li/901412345678`
- `…/v/li/901412345678/…?block=…`
- `…/v/l/901412345678` — an older form, same meaning

If you cannot find a numeric ID in what they pasted, say so and ask them to
open the List and copy the URL from the address bar. Do not guess at an ID and
do not search by name hoping to land on it.

## Confirm it before writing anything

Fetch the List with `clickup_get_list` and check three things:

- **The name matches** what you asked them to type. Close is not a match. If it
  differs, show both and ask which is right — they may have improved on it, or
  they may have created it in the wrong place and renamed something else.
- **It is in the confirmed Folder.** A List created one Folder over shows up
  wrong in rollups and is annoying to move later. Say so now, while it is empty.
- **It has the template's structure.** If it came back with no custom statuses
  and no views beyond the default, the template probably did not get applied.
  Ask before proceeding rather than recording `Template applied:` for a template
  that is not there.

## Then: initialize or update

Read the List description. This is the branch that decides what the rest of the
skill does:

- **No fact block** — a fresh List. Carry on to step 6 and gather the facts.
- **A fact block already there** — this List has been through the skill before.
  It is an update, not a re-scaffold. Go to `edge-cases.md`, which covers why the
  original target date must survive.

This check is the reason the URL is the handle for everything afterwards. The
skill keeps no state of its own, so a List URL plus its description is the entire
record of whether a KE project has been set up. That is also why step 9 puts the
URL in the Claude Project's knowledge — it is what makes the next session able to
pick up where this one stopped, without asking the user to remember anything.

## When the user cannot use the template

Some reasons are legitimate: the template is not shared with their account, the
link opens the template center empty, they are on mobile, they are in a hurry.

Offer the fallback explicitly and let them choose:

> I can create it bare instead — right name, right Folder, no template. You would
> apply the template yourself later. Want me to?

If they take it, create the List with `clickup_create_list_in_folder`, record
`Template applied: none (apply manually)` in the description, and say plainly
that the template still needs applying. Do not let that line go unrecorded — it
is the only trace that the List is incomplete.

If the template is missing for everyone rather than just this user, that is worth
saying out loud once: a template that has been deleted or unshared will fail the
same way for every KE project set up after this one.
