# Working from a Brief that already exists

A Brief is often written before anything exists in ClickUp — in a Claude Project,
a Google Doc, a Slack thread, or someone's notes app. That is a normal order of
operations, not a mistake to correct.

Ask for it early, take what it gives you, and do not make the user repeat
themselves.

## Asking

> Has a Brief been written for this KE project yet? Paste it, point me at it, or
> say no — either way is fine.

Accept it in any form: pasted text, a file in the Claude Project, a ClickUp doc
on some other List, a link you can read. If you cannot read a link, ask them to
paste the text rather than guessing at the contents.

If the answer is no, say that is fine and carry on. It gets written afterwards
with `/pm-project-brief`.

## What to take from it

| Looking for | Usually found in |
|---|---|
| KE project name | The title |
| Owner | A byline, or "owner:" line |
| Original target date | `Summary`, `Approach`, or a dates line |
| Whether it is a roadmap project | Rarely stated — ask |

Take only what the Brief actually says. A Brief that mentions "shipping before
hunting season" is not a target date.

## How far to trust it

**Confirm, do not adopt.** Everything you pull out gets played back as a
question with an easy yes:

> The Brief says the target is September 30 — still right?

Two reasons. A Brief may be weeks old and the dates may have moved. And a Brief
is a document; the fact block is a record other skills act on, so a wrong value
in it is louder than a wrong value in prose.

**Never infer the roadmap call from a Brief.** It reads as important because
Briefs are written to read as important. Ask.

**Do not fill gaps from the Brief's tone.** If it does not name an owner, ask
who the owner is. Do not assume it is whoever wrote it.

## The name

Take the name from the Brief, then run it through
`naming-rules.md` anyway.

A name that has only ever been a document title has never had to stand on its
own in a report next to forty other KE projects. "Login Flow 2.0" is a fine
title on a doc that opens with two paragraphs of context and useless in a
rollup. This is the last cheap moment to change it.

## Landing it

Once the List exists, check the Brief against the standard before doing anything
with it. A Brief that already meets it should just be posted; one that does not
should go to `/pm-project-brief` rather than be quietly fixed here.

### The check

It passes if all of these are true:

1. **The six sections are present, in order**, with these exact headings:
   `Summary`, `Problem`, `Goals or Success Metrics`, `Users`, `Approach`,
   `Open Questions & Risks`.
2. **Nothing extra.** A `Background`, `Requirements`, `Timeline`, or `Scope`
   section means it is a different document wearing a Brief's clothes.
3. **The full KE project name is the opening heading.** If it is missing but
   everything else is right, add it and say you did — that is a one-line fix,
   not a reason to send someone back through an interview.
4. **No placeholder text.** No square brackets, no "TODO", no template guidance
   left in the prose. `TBD` in `Approach` or `Open Questions & Risks` is fine
   and expected early on.
5. **No execution detail.** Task lists, acceptance criteria, sequencing, or
   who-does-what-this-week mean it is a spec, and the whole point of the Brief
   is that it is not one.

Judge structure and scope, not polish. Wording that is a little corporate is not
a failure — send it back only for something a reader would actually trip over.

### If it passes

Show the user what you are about to post, then create the `Brief` doc. Say
briefly what you checked, so it is clear the standard was applied rather than
skipped.

### If it does not

Name what is off — specifically, not "it does not match the template" — and
point at `/pm-project-brief`:

> This is close, but there is no `Users` section and the `Background` section is
> not part of the template. Run `/pm-project-brief` and it will work from what you
> have written rather than starting over.

Do not fix it yourself, and do not post it as-is. If the user insists on posting
their version unchanged, that is their call — say what will differ from every
other Brief in the workspace and let them decide.
