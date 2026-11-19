---@class State
---@field repos table<string, Segment[]> Mapping between a repository directory and its rendered summary
---@field dirs table<string, table<string, Cells>> Mapping between a directory and the cells of the repositories in it
---@field changes table<string, Change[]> Mapping between a repository directory and its changed files
---@field opts Options

---@class Options
---@field order number The order in which the summary is displayed in the linemode
---@field style Style The style of the summary
---@field styles table<string, Style> Style per part of the summary, falls back to `style`
---@field icon string Text shown before the branch name
---@field icon_only_clean boolean Whether to show the icon only for repositories without any signs
---@field align boolean Whether to align the signs of the repositories in a directory
---@field signs table<string, string> Sign per status, an empty string hides that status
---@field branch BranchOptions
---@field preview PreviewOptions

---@class BranchOptions
---@field hide table<string, boolean> Branches whose name is not shown, only the icon and signs
---@field max number? Longest branch name in cells, longer ones are cut with `…`

---@class PreviewOptions
---@field height number Largest part of the preview the changed files may take, 0 to not show them
---@field format "short"|"long" `git status --short` or grouped like `git status`
---@field stat boolean Whether to show the lines added and removed per file

---@class Cells: table<string, string> Text per sign, an empty string when it does not apply
---@field icon string Icon shown before the branch name
---@field branch string Branch name, empty when hidden

---@class Segment
---@field text string
---@field name string? Part of the summary the text belongs to, used to look up its style

---@class RepoStatus
---@field branch string? Current branch, `nil` when HEAD is detached
---@field oid string? Current commit
---@field ahead number
---@field behind number
---@field conflicted boolean?
---@field untracked boolean?
---@field stashed boolean?
---@field modified boolean?
---@field staged boolean?
---@field renamed boolean?
---@field deleted boolean?
---@field changes Change[]

---@class Change
---@field xy string Index and working tree status, like `git status --short` but with `.` for unchanged
---@field path string
---@field orig string? Original path of a rename or copy
---@field staged Stat? Lines changed in the index, only with `preview.stat`
---@field unstaged Stat? Lines changed in the working tree, only with `preview.stat`

---@class Stat
---@field added number? `nil` for binary files
---@field removed number? `nil` for binary files

---@class Row
---@field left Line
---@field right Line?
---@field header boolean? Whether this is the title of a section

---@alias UnstableFetcher fun(self: unknown, job: { files: File[] })
