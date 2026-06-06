# Neovim Cheat Sheet
> v0.11.6 · lazy.nvim · pyright · telescope · neo-tree

---

## Modes

| Mode | Enter | Purpose |
|------|-------|---------|
| Normal | `Esc` | Navigate, run commands |
| Insert | `i` `a` `o` | Type text |
| Visual | `v` `V` `Ctrl+v` | Select text |
| Command | `:` | Run Ex commands |

---

## Navigation

| Key | Action |
|-----|--------|
| `h j k l` | ← ↓ ↑ → |
| `w` / `b` | next / prev word |
| `e` | end of word |
| `0` / `$` | line start / end |
| `^` | first non-blank char |
| `gg` / `G` | file top / bottom |
| `50G` | go to line 50 |
| `{` / `}` | paragraph up / down |
| `%` | jump to matching bracket |
| `Ctrl+d` / `Ctrl+u` | half page down / up |
| `Ctrl+f` / `Ctrl+b` | full page down / up |
| `zz` | center cursor on screen |
| `H` / `M` / `L` | top / mid / bottom of screen |
| `Ctrl+o` / `Ctrl+i` | jump back / forward in history |
| `f+x` | jump to char x on line |

---

## Insert Mode Entry

| Key | Action |
|-----|--------|
| `i` | insert before cursor |
| `I` | insert at line start |
| `a` | append after cursor |
| `A` | append at line end |
| `o` | new line below |
| `O` | new line above |
| `s` | delete char + insert |
| `S` | delete line + insert |
| `C` | change to end of line |

---

## Editing

| Key | Action |
|-----|--------|
| `dd` | delete line |
| `D` | delete to end of line |
| `dw` | delete word |
| `yy` | yank (copy) line |
| `yw` | yank word |
| `p` / `P` | paste below / above |
| `u` | undo |
| `Ctrl+r` | redo |
| `.` | repeat last action ⭐ |
| `x` | delete char under cursor |
| `~` | toggle case |
| `J` | join line below |

---

## Verb + Motion

Compose commands: **verb** + **motion** = action

| Verb | Meaning |
|------|---------|
| `d` | delete |
| `c` | change (delete + insert) |
| `y` | yank (copy) |
| `v` | select |

| Text Object | Meaning |
|-------------|---------|
| `w` | word |
| `$` | end of line |
| `i"` | inside quotes |
| `a"` | around quotes |
| `i{` | inside braces |
| `ip` | inner paragraph |
| `it` | inner HTML tag |

**Examples:**

```
dw      delete word
d$      delete to end of line
ci"     change inside quotes
yip     yank inner paragraph
ca{     change around braces
gg=G    auto-indent whole file
viw     select word
```

---

## Search & Replace

| Key | Action |
|-----|--------|
| `/word` | search forward |
| `?word` | search backward |
| `n` / `N` | next / prev match |
| `*` | search word under cursor (forward) |
| `#` | search word under cursor (backward) |
| `:noh` | clear highlights |
| `:%s/old/new/g` | replace all in file |
| `:%s/old/new/gc` | replace all with confirm |
| `:s/old/new/g` | replace in current line |

---

## Visual Mode

| Key | Action |
|-----|--------|
| `v` | character select |
| `V` | line select |
| `Ctrl+v` | block select |
| `y` | yank selection |
| `d` | delete selection |
| `c` | change selection |
| `>` / `<` | indent / unindent |
| `u` / `U` | lower / upper case |
| `~` | toggle case |
| `J` / `K` | move selection down / up |

---

## Files & Buffers

| Key | Action |
|-----|--------|
| `:w` | save |
| `:q` | quit |
| `:q!` | force quit |
| `:wq` | save and quit |
| `Tab` | next buffer (tab) |
| `Shift+Tab` | prev buffer (tab) |
| `<leader>x` | close current buffer |
| `:bd` | close buffer |
| `:e filename` | open file |

---

## Splits & Windows

| Key | Action |
|-----|--------|
| `:vsplit` | vertical split |
| `:split` | horizontal split |
| `Ctrl+h` | move to left window |
| `Ctrl+l` | move to right window |
| `Ctrl+j` | move to bottom window |
| `Ctrl+k` | move to top window |
| `Ctrl+w q` | close window |

---

## Your Keybinds

> Leader key = `Space`

### Telescope (Fuzzy Finder)

| Key | Action |
|-----|--------|
| `<leader>ff` | find files |
| `<leader>fg` | live grep (search content) |
| `<leader>fb` | open buffers |
| `<leader>fr` | recent files |
| `<leader>fh` | help tags |

> Inside Telescope: `Ctrl+j/k` navigate · `Enter` open · `Esc` close

### Neo-tree (File Explorer)

| Key | Action |
|-----|--------|
| `Ctrl+b` | toggle sidebar |
| `<leader>e` | toggle sidebar (alt) |

> Inside Neo-tree: `Enter` open · `a` create · `r` rename · `d` delete · `q` close

### LSP (Code Intelligence)

| Key | Action |
|-----|--------|
| `gd` | go to definition |
| `gD` | go to declaration |
| `gr` | find references |
| `gi` | go to implementation |
| `K` | show documentation |
| `<leader>rn` | rename symbol |
| `<leader>ca` | code actions |
| `<leader>f` | format file |
| `[d` / `]d` | prev / next error |
| `<leader>d` | show error detail |

### Git (Gitsigns)

| Key | Action |
|-----|--------|
| `<leader>gp` | preview hunk |
| `<leader>gb` | git blame line |
| `<leader>gr` | revert hunk |
| `]g` / `[g` | next / prev change |

### General

| Key | Action |
|-----|--------|
| `<leader>w` | save file |
| `<leader>q` | quit |
| `<leader>h` | clear search highlight |
| `<leader>t` | open terminal |

---

## Autocomplete (nvim-cmp)

| Key | Action |
|-----|--------|
| `Ctrl+Space` | trigger completion |
| `Tab` | next suggestion / confirm |
| `Shift+Tab` | prev suggestion |
| `Ctrl+j` | next item |
| `Ctrl+k` | prev item |
| `Enter` | confirm selection |
| `Esc` | close menu |

---

## Comments (Comment.nvim)

| Key | Action |
|-----|--------|
| `gcc` | toggle line comment |
| `gbc` | toggle block comment |
| `gc` | toggle comment (visual mode) |

---

## Lazy.nvim (Plugin Manager)

| Command | Action |
|---------|--------|
| `:Lazy` | open plugin manager |
| `:Lazy sync` | install + update plugins |
| `:Lazy update` | update plugins |
| `:Lazy clean` | remove unused plugins |
| `:Mason` | open LSP installer |
| `:MasonInstall pyright` | install Python LSP |
| `:checkhealth` | diagnose issues |

---

## Terminal

| Key / Command | Action |
|---------------|--------|
| `<leader>t` | open terminal |
| `Ctrl+\ Ctrl+n` | exit terminal mode (back to normal) |
| `:terminal` | open terminal via command |

---

## Tips

- **`.`** — repeats your last action. Most powerful key in Neovim.
- **`*`** — instantly searches the word under your cursor.
- **`Ctrl+o`** — jumps back to where you were (like browser back button).
- **`gg=G`** — auto-indents the entire file.
- **`ci"`** — change inside quotes without manually selecting.
- **`:earlier 5m`** — undo everything from the last 5 minutes.
- **`q:`** — opens command history, useful for editing long commands.
- **`vimtutor`** — interactive tutorial, run it in terminal.
