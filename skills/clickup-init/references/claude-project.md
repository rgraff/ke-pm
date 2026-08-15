# Setting up the Claude Project

A skill cannot create a Claude Project — there is no tool for it. What `clickup-init`
can do is tell the user how to set one up and what to keep in it, which is worth
doing once, at setup, rather than leaving them to work it out.

## The division of labour

**ClickUp holds the record.** Facts, decisions, the Brief, the tasks. Anyone on
the squad can see it, and it survives whoever set it up.

**The Claude Project holds the workbench.** The messy inputs that produced those
decisions: interview transcripts, Slack threads, research notes, half-formed
thinking. This material is useful while the KE project is live and does not
belong in a team document.

The line to hold: if someone else would need it to understand the KE project, it
goes to ClickUp. If it is raw material you are working from, it goes in the
Claude Project.

## What to tell the user

Adapt this; do not paste it verbatim if the conversation already covered part of
it.

> Worth setting up a Claude Project for this KE project, so context stays in one
> place across sessions.
>
> In Claude (desktop or web), go to **Projects** → **New project** and name it
> the same as the KE project — "[name]" — so it matches the ClickUp List.
>
> Then add to the project's knowledge:
>
> - The ClickUp List URL: `[url]`
> - The `Brief`, once `/ke-pm:brief` has written it
> - Anything you are working from: interview notes, transcripts, research,
>   screenshots, links
>
> Run the `/ke-pm:*` commands from inside that Claude Project. They read the
> facts from ClickUp either way, but the extra context makes the Brief and the
> weekly updates better.
>
> Two habits worth keeping:
>
> - **One Claude Project per KE project.** Sharing one across several KE
>   projects bleeds context between them and the drafts get worse.
> - **Decisions go to ClickUp, not just to the chat.** Anything that becomes
>   real — a scope change, a date slip, a chosen approach — belongs in the Brief
>   taks, or a weekly update, where the squad can see it. A decision that only exists
>   in a Claude conversation is invisible to everyone else.

## What not to put in the Claude Project

- Credentials, API keys, or anything else secret.
- Customer personal information from research — strip names and contact details
  from transcripts first.
- The facts of record. Target dates, the capitalizable designation, and the
  Brief live in ClickUp. A second copy in Claude drifts from the first, and the
  copy the squad cannot see is the one that will be wrong.

## If the user is already in a Claude Project

Do not push them to make another. Confirm the ClickUp List URL is in its
knowledge so later sessions can find the List without asking, and move on.

## If they would rather not

Fine. Nothing in `ke-pm` requires a Claude Project — the skills read everything
they need from ClickUp. Say so and drop it. This is a suggestion, not a step
that has to pass.
