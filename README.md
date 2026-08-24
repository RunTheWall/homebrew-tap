# Run The Wall Homebrew tap

Install [Constly](https://constly.com) on macOS with Homebrew. Constly is a
WYSIWYG markdown editor that renders the marks away as you type.

```sh
brew install --cask runthewall/tap/constly
```

Or tap first, then install:

```sh
brew tap runthewall/tap
brew install --cask constly
```

The cask points at the signed, notarized per-arch builds hosted on
`downloads.constly.com` (Apple Silicon and Intel). Constly ships its own
auto-updater and keeps itself current, so `brew upgrade` is intentionally a
no-op for this cask (`auto_updates true`).

Downloads for every platform, including Windows and Linux, are on the
[download page](https://constly.com/download).
