---
order: 70
icon: dot
---

# Workspace Info

You can place a file named `info.md` in your `config` folder with markdown-formatted information about your jobs workspace.

This file will be pretty-printed when running `jobly info`.

You can use this file as a template:

```markdown config/info.md
# Workspace Name

Describe your jobs here using markdown.

# JobName

Describe the job

## Arguments:

*branch* (required)
Argument description here

*environment* (default: `production`)
Argument description here
```
