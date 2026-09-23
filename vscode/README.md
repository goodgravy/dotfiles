# vscode

VS Code user config, linked into `~/Library/Application Support/Code/User/`.

| File | Purpose |
|---|---|
| `settings.json` | Editor, theme, Vim, Python, TypeScript settings (JSONC, full-line comments only) |
| `keybindings.json` | Vim-flavoured keys for pickers, completion, and the Explorer |
| `extensions.txt` | Extension IDs installed by `setup.sh` |
| `setup.sh` | Installs extensions; disables macOS press-and-hold for VS Code |
| `teardown.sh` | Re-enables press-and-hold |

## Principles

- Mirrors `neovim/config/nvim.symlink/init.lua`: leader `,`, `jj`/`jk` to escape,
  `<C-hjkl>` between splits, telescope-style `<leader>` pickers, nvim 0.11 `gr*` LSP maps.
- Theme follows macOS appearance (Catppuccin Latte/Mocha), like `bat` and Ghostty.
- Claude Code is used from the terminal, so the built-in AI/Copilot chat UI is
  disabled (`chat.disableAIFeatures`) and the Claude Code extension is not installed.
- Formatters only run where the project opts in: Prettier needs a config file,
  Ruff and ESLint pick up the nearest `pyproject.toml` / ESLint config.

## Key map cheat sheet

| Keys | Action |
|---|---|
| `,f` `,sf` | Quick open (find files) |
| `,a` `,sg` | Search in files |
| `,sw` | Search word under cursor / selection |
| `,b` `,,` | Open editors |
| `,s.` | Recent files/folders |
| `,sc` | Command palette |
| `,sk` | Keyboard shortcuts |
| `,sd` `,q` | Problems panel |
| `,/` | Find in file |
| `grn` `gra` | Rename, code action |
| `grr` `gri` `grd` `grD` `grt` | References, implementation, definition, declaration, type definition |
| `gO` `gW` | Document symbols, workspace symbols |
| `[d` `]d` | Previous / next diagnostic |
| `[c` `]c` | Previous / next git change |
| `,hp` `,hs` `,hr` `,hb` | Preview / stage / revert hunk, toggle blame |
| `,d` `,n` | Toggle sidebar, reveal file in Explorer |
| `,hl` `Esc` | Clear search highlight |
| `K` | Hover |
| `Ctrl+Option` (hold) | Show inlay hints |
| `Ctrl+n/p` `Ctrl+y` | Navigate / accept in completion, code actions, quick open |

In the Explorer: `j k h l o Enter a A r d y x p Y W q / Esc` behave like nvim-tree.

## Adding an extension

```sh
code --install-extension <publisher.name>
code --list-extensions          # copy the ID into extensions.txt
```

## Alternatives considered

- `asvetliakov.vscode-neovim` embeds real Neovim (your init.lua, plugins and all)
  instead of emulating it. More faithful, more setup. Swap `vscodevim.vim` for it
  if VSCodeVim's emulation gaps start to grate.
- `detachhead.basedpyright` is a stricter, open-source Pylance replacement.
- `vitest.explorer` / `ms-playwright.playwright` add in-editor test runners;
  omitted in favour of the terminal.
- `eamodio.gitlens`, GitHub PR extension: omitted, git lives in the terminal
  (lazygit, delta, gh).
