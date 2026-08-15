# Connection checks

`/ke-pm:clickup-init` verifies two connections before it does anything else. The user
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
that has to be redone. Give the user this:

> ❌ ClickUp is not connected. `ke-pm` cannot do anything without it.
>
> Add this to `.mcp.json` in the directory you are running Claude Code from:
>
> ```json
> {
>   "mcpServers": {
>     "clickup": { "type": "http", "url": "https://mcp.clickup.com/mcp" }
>   }
> }
> ```
>
> Then restart Claude Code and approve the server when prompted. Run
> `/ke-pm:clickup-init` again once it is connected.

Finding ClickUp tools proves the server is reachable, not that the account can
write. If a later step fails on permissions, see `troubleshooting.md`.

## Slack — checked, never blocking

```
ToolSearch(query: "+slack", max_results: 30)
```

Slack is where the phase 2 skills post: `/ke-pm:update` posts the weekly project
update to `#project-updates`, and `/ke-pm:standup` posts to `#standups`. Neither
`/ke-pm:clickup-init` nor `/ke-pm:brief` touches Slack.

So check it, report it, and move on:

> ✅ Slack connected.

or

> ⚠️ Slack is not connected. Nothing in `/ke-pm:clickup-init` or `/ke-pm:brief` needs
> it, so we can carry on. When `/ke-pm:update` and `/ke-pm:standup` arrive they
> will not be able to post until it is set up.

Never stop the skill over Slack, and do not push the user to fix it now. They
came here to set up a KE project.

If Slack tools are present, confirm the two channels are visible when the
tooling makes that cheap. If it is not cheap, skip it — a connection check that
costs five tool calls is worse than no check.

> **Open setup question:** the Slack MCP endpoint for Kalkomey is not settled
> yet. Until it is, probe for whatever Slack tooling is present and report what
> you found by name. Pin this down before `/ke-pm:update` ships.
