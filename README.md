# Neovim Config
> Kanan Suleymanli | · v0.11.6 · lazy.nvim

Lightweight Neovim setup as a VS Code replacement on air-gapped/restricted servers.
No LSP (no npm/node required). Works out of the box with just Python and Git.

---

## Plugins

| Plugin | Purpose |
|--------|---------|
| `tokyonight.nvim` | Dark theme |
| `lualine.nvim` | Status bar |
| `bufferline.nvim` | File tabs |
| `neo-tree.nvim` | File explorer sidebar |
| `telescope.nvim` | Fuzzy file/content search |
| `nvim-treesitter` | Syntax highlighting |
| `gitsigns.nvim` | Git diff & blame |
| `nvim-autopairs` | Auto close brackets/quotes |
| `Comment.nvim` | Comment toggle |
| `indent-blankline.nvim` | Indent guide lines |

---

## Requirements

- Neovim **v0.10+** (tested on v0.11.6)
- Git
- `make` (for telescope-fzf-native)
- No npm, no Node.js, no sudo needed

---

## Install

### Fresh machine

```bash
# Install Neovim
curl -LO https://github.com/neovim/neovim/releases/download/v0.11.6/nvim-linux-x86_64.appimage
chmod +x nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim

# Clone config
mkdir -p ~/.config/nvim
cp init.lua ~/.config/nvim/init.lua

# Open Neovim — lazy.nvim auto-installs on first launch
nvim
```

Then run `:Lazy sync` inside Neovim.

### Same machine, different user (fastest)

```bash
cp -r /home/data/.config/nvim ~/.config/nvim
cp -r /home/data/.local/share/nvim ~/.local/share/nvim
nvim
```

No internet or `:Lazy sync` needed — plugins are already installed.

---

## Key Bindings

> Leader key = `Space`

### Navigation
| Key | Action |
|-----|--------|
| `Ctrl+B` | Toggle file tree |
| `<leader>e` | Toggle file tree (alt) |
| `<leader>ff` | Find files |
| `<leader>fg` | Search content across files |
| `<leader>fr` | Recent files |
| `<leader>fb` | Open buffers |
| `Tab` / `Shift+Tab` | Next / prev buffer tab |
| `<leader>x` | Close buffer |

### Windows
| Key | Action |
|-----|--------|
| `Ctrl+h/l/j/k` | Move between splits |
| `:vsplit` | Vertical split |
| `:split` | Horizontal split |

### Editing
| Key | Action |
|-----|--------|
| `gcc` | Toggle line comment |
| `gc` | Toggle comment (visual) |
| `<leader>w` | Save |
| `<leader>q` | Quit |
| `<leader>h` | Clear search highlight |
| `<leader>t` | Open terminal |

### Git
| Key | Action |
|-----|--------|
| `<leader>gb` | Git blame |
| `<leader>gp` | Preview hunk |
| `<leader>gr` | Revert hunk |
| `]g` / `[g` | Next / prev change |

### Clipboard
| Key | Action |
|-----|--------|
| `Ctrl+A` | Select all |
| `Ctrl+C` | Copy to system clipboard (visual) |
| `Ctrl+V` | Paste from system clipboard |
| `yy` | Yank line |
| `p` / `P` | Paste below / above |

---

## File Structure

```
~/.config/nvim/
└── init.lua        ← single file config, all plugins + keybinds
```

---

## Useful Commands

```
:Lazy             open plugin manager
:Lazy sync        install / update plugins
:Lazy clean       remove unused plugins
:checkhealth      diagnose issues
:pwd              show current directory
:cd <path>        change directory
:terminal         open terminal inside Neovim
:!python3 %       run current Python file
```

---

## Adding LSP Later (requires npm)

If Node.js becomes available on the server:

```bash
node --version   # verify
npm --version
```

Then add to `init.lua`:

```lua
{ "neovim/nvim-lspconfig" },
{ "williamboman/mason.nvim" },
{ "williamboman/mason-lspconfig.nvim" },
{ "hrsh7th/nvim-cmp" },
{ "hrsh7th/cmp-nvim-lsp" },
```

Run `:Lazy sync` then `:MasonInstall pyright`.

Alternatively, install pyright via pip (no npm needed):

```bash
pip install pyright --break-system-packages
```
