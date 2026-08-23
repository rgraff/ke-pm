# Connection checks

`/pm-project-init` verifies two connections before it does anything else. The user
should know what is wired up before they answer a single question.

## ClickUp — required, hard stop

```
ToolSearch(query: "+clickup", max_results: 30)
```

If tools come back, look up the authenticated ClickUp user in the same breath —
it proves the connection resolves to a real account, and it gives you the name to
offer as the KE project's owner later. Report it and continue:

> ✅ ClickUp connected as Robert Graff.

If the tools are there but the user lookup is not available, say
`✅ ClickUp connected.` and ask for the owner outright in step 5.

If nothing comes back, **stop the skill**. Every remaining step writes to
ClickUp; there is no useful degraded mode, and offering one just produces work
that has to be redone.

### Two reasons no tools came back

They need opposite fixes, and prescribing the wrong one sends someone to edit a
config file that is already correct.

**Not authorized** — the usual one when `ke-pm` was installed as a plugin. The
plugin ships its own `.mcp.json`, so the server is registered as
`plugin:ke-pm:clickup` but has not been through OAuth yet, or its authorization
has lapsed. Nothing needs configuring; it needs approving.

**Not configured** — only happens when the skills are being run without
installing the plugin, usually through `claude --plugin-dir`. Then there is no
server at all.

You cannot tell these apart from inside the skill — there is no tool here that
reads MCP config. So lead with the authorization case, which is far more common,
and give the user the one-line test:

> ❌ ClickUp is not connected. `ke-pm` cannot do anything without it.
>
> Run `/mcp` in an interactive Claude Code session and look for
> **`plugin:ke-pm:clickup`**.
>
> **If it is listed**, it just needs authorizing — approve it there, then run
> `/pm-project-init` again. This is the usual case; the ClickUp server ships
> with the plugin, so nothing needs configuring.
>
> **If it is not listed**, you are running the skills without the plugin
> installed. Either install it —
> `claude plugin marketplace add <path-or-repo>` then
> `claude plugin install ke-pm@ke-pm` — or add the server by hand to `.mcp.json`
> in the directory you are running from:
>
> ```json
> {
>   "mcpServers": {
>     "clickup": { "type": "http", "url": "https://mcp.clickup.com/mcp" }
>   }
> }
> ```
>
> Then restart Claude Code and approve the server when prompted.

Never ask the user for an authorization code, token, or callback URL, and never
offer to run the OAuth flow yourself. Approving the server is something they do
in their own session.

Finding ClickUp tools proves the server is reachable, not that the account can
write. If a later step fails on permissions, see `troubleshooting.md`.

## Slack — checked, never blocking

```
ToolSearch(query: "+slack", max_results: 30)
```

Slack is where the weekly project update goes (`#project-updates`) and where
stand-ups are threaded (`#standups`). Neither `/pm-project-init` nor
`/pm-project-brief` touches Slack — they check it only so the user knows where
they stand before those posts come due.

So check it, report it, and move on:

> ✅ Slack connected.

or

> ⚠️ Slack is not connected. Nothing in `/pm-project-init` or `/pm-project-brief`
> needs it, so we can carry on — worth sorting before the first weekly update is
> due.

Never stop the skill over Slack, and do not push the user to fix it now. They
came here to set up a KE project.

A Slack server that is registered but unauthorized looks identical to no server
at all from in here. If the user says Slack is set up, mention `/mcp` once — the
same test as ClickUp above — and carry on regardless.

If Slack tools are present, confirm the two channels are visible when the
tooling makes that cheap. If it is not cheap, skip it — a connection check that
costs five tool calls is worse than no check.

> **Open setup question:** the Slack MCP endpoint for Kalkomey is not settled
> yet. Until it is, probe for whatever Slack tooling is present and report what
> you found by name.
