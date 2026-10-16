---
name: notion-skill-updater
description: Use when the user wants to edit, rename, improve, or create a skill installed from a Notion-backed marketplace. Writes the change back to its source in Notion via the Notion MCP so it persists across syncs.
---

# Updating Notion-backed skills

These skills are generated from Notion, which is the **source of truth**. When
you change a skill, write the change **back to Notion** through the Notion MCP.
Editing the installed `SKILL.md` files directly will not stick because they are
overwritten the next time the plugin syncs.

## Before you change anything

1. Find the Notion page that backs the skill:
   - Prefer a `notion_page_id` in the skill's frontmatter or a
     `.notion-sync.json` file next to `SKILL.md`, when either is present.
   - Otherwise, use the Notion MCP to search for the exact skill name. Load the
     likely page and confirm its title, description, and instructions match the
     installed skill before editing it.
2. **Tell the user the change will be saved to Notion**. That is where the skill
   is stored, not in the installed files.
3. Give a concise overview of what you will change and ask for an OK before
   writing anything. For a small edit, show the exact change inline. For a
   larger edit, summarize the changes instead of pasting the full rewrite.
4. Offer to show the precise new wording or a diff before writing if the user
   wants to review it in detail.

## Edit the skill directly

Load the source page, then use the Notion MCP to update it:

- **Instructions or behavior** (the skill body) → update the page content.
- **Description** ("when to use") → update the `Description` property.
- **Rename** → update the title property, usually `Skill name`. This changes the
  skill's folder or slug on the next sync.

Make the smallest safe update and preserve unrelated page content and
properties. Afterward, tell the user the change will appear in the marketplace
on the next sync; they may need to update or reinstall the plugin to receive it.

## Add or update the skill's files

A skill can ship more than `SKILL.md`, including helper scripts and reference
docs. These come from the skill page's `Files` property.

**Bundle them into a single `.zip`** — most source file types cannot be uploaded
on their own, and a zip carries any file type and any folder structure.

1. Build the archive with the files at its root, not inside a wrapping folder —
   it should contain `scripts/run.py`, not `my-skill/scripts/run.py`:

   ```bash
   cd path/to/skill-files
   zip -r ../skill-files.zip . -x '*.DS_Store'
   ```

2. Upload it with the Notion MCP's file upload tool, then set the skill page's
   `Files` property to the resulting upload. Setting the property replaces its
   current file list, so include anything that should stay.

To change or remove files, attach a new archive in place of the old one.

`SKILL.md` is always regenerated from the skill page's content,
so you don't need to ship it as a file in the .zip archive.

## Create a new skill

1. Gather a short skill name, a one-line description of when to use it, and the
   instruction body.
2. Use the Notion MCP to find the target Skills database. If there are multiple
   plausible databases, ask the user which one to use. Load its data source to
   confirm the exact property names.
3. Create a page in that data source. Set the title, `Description`, and page
   content. If the database has a publication property, publish it only when
   the user says it is ready to share.
4. If the new skill needs scripts, references, or other files, build the whole
   folder of extras locally first, then follow the archive workflow above to
   attach it to the new page.

## Notes

- Do not hand-edit generated local files; they are regenerated from Notion.
- If the Notion MCP is not authenticated, prompt the user to authorize it in
  the browser.
