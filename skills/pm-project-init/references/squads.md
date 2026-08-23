# Squads and team emojis

> Source: kalkomey/playbook — `processes/standups.md` (as of 2026-08-15,
> tracking an open PR that renames several squads)
>
> **Term change:** we say **squad**. The playbook page this came from still says
> *working group*, and the Slack emoji names still carry the `wg-` prefix. Use
> "squad" in everything you say and write; copy the emoji names exactly as they
> appear below. Renaming an emoji breaks the post.

Every KE project belongs to a squad. The squad determines the team emoji that
leads its Slack posts — the daily stand-up thread opener and the weekly project
update header. That emoji is what makes those channels scannable by team, so it
is never optional and never improvised.

`/ke-pm:pm-project-init` records the squad and its emoji in the List description.
It is the only place either gets captured, and `/ke-pm:update` and
`/ke-pm:standup` read it back from there.

## The table is a starting point, not the authority

**Squads change.** They get renamed, merged, and created faster than this file
or the playbook gets updated. Several names below changed recently while their
emoji stayed the same, which is why the two no longer match.

**`#standups` in Slack is the live answer.** When Slack is connected, the recent
thread openers there show which squads are actually posting and which emoji each
one uses. Check when something looks off — a squad the user names that is not in
this table, an emoji that does not match, or a squad here that nobody has posted
under in weeks.

When Slack is not connected, use the table and say it may be out of date.

## Current squads

| Squad | Emoji |
|---|---|
| Huntwise | `:wg-huntwise:` |
| Agency Operations | `:wg-rangers:` |
| Marketing Acquisition | `:wg-funnel-experimentation:` |
| Interactive | `:wg-boat-ed:` |
| LMS | `:wg-slingshot:` |
| GovSuite | `:wg-agency-solutions:` |
| Platform | `:wg-platform:` |
| Data Engineering | `:wg-data-engineering:` |

The emoji names lag the squad names — `:wg-rangers:` belongs to Agency
Operations, `:wg-funnel-experimentation:` to Marketing Acquisition,
`:wg-agency-solutions:` to GovSuite. That is expected and correct. Renaming a
Slack emoji breaks every post that already uses it, so the old names stay.

That applies to names that are *out of date*, not to names that look *misspelled*.
Every emoji in this table is spelled the way Slack has it. If one looks like a
typo, it is a typo in this file — say so and let it be corrected. Do not tell the
user a misspelling is deliberate; that is how a broken emoji survives a review.

## When the squad is not in the table

Allow it, but do not reach for it first. A squad missing from the table is
usually one that was renamed rather than one that is new, and a KE project filed
under a name nobody else uses is invisible in `#standups` and in the weekly
updates.

1. **Check whether it is a rename.** Look for the same team under an older name
   here, and in `#standups` if Slack is connected. "Is that the squad that used
   to be called Rangers?" settles it in one question.
2. **If it is genuinely new, take it.** Ask for the emoji **exactly as it
   appears in `#standups`**, character for character. Do not build
   `:wg-<squad-name>:` from the squad name — an emoji that does not exist renders
   as raw text in every post that uses it.
3. **Say the table needs updating.** This file and the playbook's stand-ups page
   both need the new row. Say it once and move on; it is not the user's problem
   to solve right now.

Never invent an emoji. A plausible-looking one that belongs to nobody is worse
in `#standups` than a missing one, because nobody notices it is wrong.

## Notes

- One emoji per squad. If a squad changes its emoji, this table changes too, and
  so does the playbook page it came from.
- Two squads operating as one pick one of the two emojis and stay consistent.
