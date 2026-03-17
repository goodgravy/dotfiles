# Dotfiles

These dotfiles are managed by [Full Stop](./full-stop/), a convention-based
dotfiles framework. See `full-stop/README.md` for the full reference.

## Quick reference

### Directory structure

Each top-level directory is a **topic** (e.g., `git/`, `fish/`, `neovim/`).
`full-stop/` and `bin/` are framework infrastructure, not topics.

### File conventions

| Pattern | Behaviour |
|---|---|
| `topic/file.symlink` | Symlinked to `~/.file` |
| `topic/dir/file.symlink` | Symlinked to `~/.dir/file` |
| `topic/file` + `topic/file.linkto` | Symlinked to the arbitrary path written in the `.linkto` file |
| `topic/setup.sh` | Runs during `full-stop` install |
| `topic/teardown.sh` | Runs during `full-stop --unlink` |
| `*.fish` files in topics | Auto-sourced by fish shell |
| `Brewfile` (root) | Homebrew packages installed via `brew bundle` |

### CLI

```
full-stop                       # full run: pull, brew, all topics
full-stop git fish              # only named topics (skips brew/pull)
full-stop --dry-run             # preview without changes
full-stop --force ghostty       # overwrite existing files (no prompts)
full-stop --unlink              # remove all managed symlinks
full-stop --unlink git          # remove only git symlinks
full-stop --list-topics         # show topics with metadata
```

Flags compose: `full-stop --unlink --dry-run git` previews unlinking git.

---

## Importing app config into dotfiles

This is the primary workflow when the user says something like "I want to manage
config for X app in dotfiles". Follow these steps:

### Step 1: Find the app's config files

Common locations to check (in order):
1. `~/.config/<app>/` (XDG standard)
2. `~/.config/<app-id>/` (e.g., `~/.config/ghostty/`)
3. `~/Library/Application Support/<bundle-id>/` (macOS apps)
4. `~/Library/Preferences/<bundle-id>.plist` (macOS preferences)
5. `~/.<app>rc` or `~/.<app>.conf` (traditional dotfiles)
6. `~/.<app>/` (traditional dotdirectories)

Use `find`, `ls`, or the app's own docs to locate config files. If unsure, ask
the user — they may know, or check `man <app>` / the app's `--help`.

Also check if the app has a Homebrew formula/cask:
```sh
brew search <app>
brew info <app>        # shows formula details
```

### Step 2: Choose the right convention

**Use `.symlink`** when the destination follows the standard dotfile pattern:
- `~/.gitconfig` -> `git/gitconfig.symlink`
- `~/.config/nvim/` -> `neovim/config/nvim.symlink/`

**Use `.linkto`** when the destination is non-standard:
- `~/Library/Application Support/com.mitchellh.ghostty/config`
- `~/Library/Preferences/some.plist`
- Any path that doesn't fit `~/.name` or `~/.dir/name`

Decision rule: if the destination starts with `~/.` and is at most one directory
deep, use `.symlink`. Otherwise, use `.linkto`.

### Step 3: Create the topic

```sh
# 1. Create the topic directory
mkdir -p <topic>/

# 2. Copy the existing config INTO the dotfiles repo
cp ~/path/to/config <topic>/config  # or whatever the filename is

# 3a. For .symlink: rename with .symlink suffix
mv <topic>/config <topic>/config.symlink
# Result: full-stop links to ~/.config (with dot prepended)

# 3b. For .linkto: create the sidecar file
echo '~/Library/Application Support/com.example/config' > <topic>/config.linkto
# Result: full-stop links to the exact path specified

# 4. For directories, copy the whole directory
cp -R ~/.config/<app>/ <topic>/config/<app>.symlink/
# Result: full-stop links ~/.config/<app> -> the symlink dir
```

### Step 4: Handle dependencies

If the app needs to be installed via Homebrew, add it to the root `Brewfile`:
```ruby
brew '<formula>'        # CLI tools
cask '<cask-name>'      # GUI apps
```

If the app needs additional setup beyond symlinking (e.g., login, activation,
shell integration), create a `setup.sh`:
```bash
#!/bin/sh
# topic/setup.sh - runs during full-stop install
```

If the setup has a meaningful inverse, create a `teardown.sh`:
```bash
#!/bin/sh
# topic/teardown.sh - runs during full-stop --unlink
```

### Step 5: Verify with dry-run

Always preview before applying:
```sh
full-stop --dry-run <topic>
```

Then apply (use `--force` to overwrite the original file with the symlink without
interactive prompting):
```sh
full-stop --force <topic>
```

### Step 6: Add shell integration (if needed)

For fish shell aliases or environment setup, create files in the topic:
- `<topic>/aliases.fish` — shell aliases (auto-sourced by fish)
- Other `*.fish` files — also auto-sourced

### Worked examples

#### Example: Ghostty terminal

```sh
mkdir -p ghostty
cp ~/Library/Application\ Support/com.mitchellh.ghostty/config ghostty/config
echo '~/Library/Application Support/com.mitchellh.ghostty/config' > ghostty/config.linkto
# Add to Brewfile: cask 'ghostty'
full-stop --dry-run ghostty
full-stop --force ghostty
```

#### Example: Starship prompt

```sh
mkdir -p starship
cp ~/.config/starship.toml starship/config/starship.toml.symlink
# This creates ~/.config/starship.toml via the nested .symlink convention
# Add to Brewfile: brew 'starship'
# Create starship/init.fish with: starship init fish | source
full-stop --dry-run starship
full-stop --force starship
```

#### Example: SSH config (already exists in this repo)

```sh
# ssh/ssh.symlink/ is a directory -> symlinked to ~/.ssh/
# Contains config, known_hosts, keys, etc.
```

### Important notes

- **Back up first.** Before moving config into the repo, the original is about
  to be replaced with a symlink. If something goes wrong, the user loses their
  config. Copy, don't move, then verify with `--dry-run`.
- **Check for secrets.** Config files sometimes contain API keys, tokens, or
  passwords. Flag these to the user. Consider using `.gitignore` or `git-crypt`
  for sensitive files.
- **Respect existing topics.** Check `full-stop --list-topics` before creating
  a new one — the app might already be partially managed.
- **Test the symlink.** After running `full-stop <topic>`, verify the app still
  works. Some apps don't follow symlinks, or resolve them differently.
- **macOS paths with spaces.** The `.linkto` convention handles these correctly.
  Always use `.linkto` for paths under `~/Library/Application Support/`.
