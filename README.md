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

## On a company Mac

IT policy may only let apps run from certain folders, such as `~/Dev` or
`~/workspace`. This installs Constly into `~/Dev`; change the folder to one
yours allows:

```sh
brew install --cask --appdir=~/Dev runthewall/tap/constly
```

## How it updates

The cask points at the signed, notarized per-arch builds attached to each
release on [RunTheWall/constly-app](https://github.com/RunTheWall/constly-app/releases)
(Apple Silicon and Intel), the same bytes as `downloads.constly.com`. Constly ships its own
auto-updater and keeps itself current, so `brew upgrade` is intentionally a
no-op for this cask (`auto_updates true`).

Downloads for every platform, including Windows and Linux, are on the
[download page](https://constly.com/download).
