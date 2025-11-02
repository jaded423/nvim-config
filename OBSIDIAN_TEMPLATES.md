# Obsidian Template Examples

Create these template files in your vault at:
`/Users/joshuabrown/Library/CloudStorage/GoogleDrive-joshua@elevatedtrading.com/My Drive/Elevated Vault/templates/`

## 1. Daily Note Template (`templates/daily.md`)

```markdown
---
title: {{date}}
date: {{date}}
tags: [daily]
---

# {{date}}

## 📅 Schedule

- [ ] Morning review
- [ ]

## 📝 Notes

-

## ✅ Tasks

- [ ]

## 🎯 Goals for Today

1.
2.
3.

## 🔗 Links

-

## 💭 Reflection

### What went well:
-

### What could be improved:
-

### Tomorrow's focus:
-

---
**Previous:** [[{{yesterday}}]]
**Next:** [[{{tomorrow}}]]
```

## 2. Meeting Note Template (`templates/meeting.md`)

```markdown
---
title: {{title}}
date: {{date}}
time: {{time}}
tags: [meeting]
type: meeting
---

# {{title}}

**Date:** {{date}}
**Time:** {{time}}
**Location/Platform:**

## 👥 Attendees

- [ ]
- [ ]

## 📋 Agenda

1.
2.
3.

## 📝 Discussion Notes

### Topic 1:

-

### Topic 2:

-

### Topic 3:

-

## ✅ Action Items

- [ ] [@person] - Task description - Due:
- [ ] [@person] - Task description - Due:

## 🔗 Related

- [[Projects/]]
- [[People/]]

## 📌 Follow-up

- Next meeting:
- Items to revisit:

---
**Created:** {{date}} {{time}}
```

## 3. Project Template (`templates/project.md`)

```markdown
---
title: {{title}}
date: {{date}}
tags: [project]
status: planning
priority: medium
---

# {{title}}

## 📊 Project Overview

**Status:** 🟡 Planning
**Priority:** Medium
**Start Date:** {{date}}
**Target Date:**
**Owner:**

## 🎯 Objectives

What are we trying to achieve?

1.
2.
3.

## 📝 Description

Detailed description of the project:



## 🗺️ Milestones

- [ ] Milestone 1 - Due:
- [ ] Milestone 2 - Due:
- [ ] Milestone 3 - Due:

## ✅ Tasks

### To Do
- [ ]

### In Progress
- [ ]

### Blocked
- [ ]

### Done
- [x]

## 👥 Stakeholders

- **Owner:**
- **Contributors:**
- **Stakeholders:**

## 📚 Resources

- [[Resource 1]]
- [[Resource 2]]

## 📌 Notes

-

## 🔄 Updates

### {{date}}
-

---
**Created:** {{date}}
**Last Updated:** {{date}}
```

## 4. Person/Contact Template (`templates/person.md`)

```markdown
---
title: {{title}}
date: {{date}}
tags: [person, contact]
type: person
---

# {{title}}

## 👤 Basic Info

**Name:** {{title}}
**Role/Title:**
**Company:**
**Email:**
**Phone:**
**LinkedIn:**

## 🤝 Relationship

**How we met:**
**Context:**
**Last contact:** {{date}}

## 📝 Notes

### First Impression


### Key Interests
-
-

### Important Details
-
-

## 💬 Conversations

### {{date}}
-

## 📋 Action Items
- [ ]

## 🔗 Related

- Projects: [[]]
- Teams: [[]]
- Meetings: [[]]

---
**Created:** {{date}}
**Last Updated:** {{date}}
```

## 5. Quick Note Template (`templates/quick.md`)

```markdown
---
title: {{title}}
date: {{date}}
time: {{time}}
tags: [inbox, quick-note]
status: unprocessed
---

# {{title}}

**Captured:** {{date}} at {{time}}



---
**Source:**
**Process:** To be reviewed and filed
```

## 6. Book/Resource Template (`templates/resource.md`)

```markdown
---
title: {{title}}
date: {{date}}
tags: [resource]
type: book
status: reading
---

# {{title}}

## 📖 Metadata

**Type:** Book / Article / Video / Course
**Author:**
**Published:**
**URL/ISBN:**
**Status:** 📖 Reading

## 🎯 Why I'm Reading This

-

## 📝 Summary

### Key Points

1.
2.
3.

## 💡 Insights

-

## ✍️ Quotes

> ""
>
> — Page X

## ✅ Action Items

- [ ]
- [ ]

## 🔗 Related

- [[]]
- [[]]

---
**Started:** {{date}}
**Completed:**
**Rating:** ⭐⭐⭐⭐⭐
```

## How to Use Templates

### Via Command
```vim
:ObsidianTemplate meeting
```

### Via Keybinding
```
<leader>oi  " Opens template picker
```

### Automatic (for daily notes)
When you run `:ObsidianToday`, it automatically uses `templates/daily.md`

### Using Custom Functions (Floating Windows)
```
<leader>om  " Meeting note in floating window
<leader>op  " Person note in floating window
<leader>oP  " Project note in floating window
```

## Folder Structure Setup

Create these folders in your vault:

```bash
cd "/Users/joshuabrown/Library/CloudStorage/GoogleDrive-joshua@elevatedtrading.com/My Drive/Elevated Vault"

mkdir -p inbox
mkdir -p daily
mkdir -p projects
mkdir -p people
mkdir -p meetings
mkdir -p resources
mkdir -p templates
mkdir -p attachments
```

## Custom Template Variables

In your `obsidian.lua` config, these custom variables are available:

- `{{date}}` - Current date (YYYY-MM-DD)
- `{{time}}` - Current time (HH:MM)
- `{{title}}` - Note title
- `{{yesterday}}` - Yesterday's date
- `{{tomorrow}}` - Tomorrow's date

You can add more in the `substitutions` section!
