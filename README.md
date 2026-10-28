# Homebrew tap for WageRoute

This is the official [Homebrew](https://brew.sh) tap for [WageRoute](https://github.com/ReVax-2007/wageroute), a local-first paycheck routing and cash flow planner for macOS. It distributes the macOS DMGs from the [WageRoute releases page](https://github.com/ReVax-2007/wageroute/releases) as a cask with per-architecture SHA-256 checksums pinned at install time.

## Install

```bash
brew tap ReVax-2007/wageroute
brew install --cask wageroute
```

Homebrew 7 asks you to trust the tap once the first time you tap it:

```bash
brew trust revax-2007/wageroute
```

The cask covers both Apple Silicon (`WageRoute-<version>-arm64.dmg`) and Intel (`WageRoute-<version>.dmg`). Homebrew verifies the downloaded DMG against the checksum pinned in the cask before installing anything.

## First launch

The WageRoute build is ad-hoc signed, not notarized. Homebrew quarantines cask downloads by default, so the first launch shows a Gatekeeper dialog — **right-click the app → Open → Open** and it opens normally from then on.

To skip the prompt entirely, remove the quarantine attribute after installing (requires your password — only do this for software you trust; it disables a real protection):

```bash
sudo xattr -rd com.apple.quarantine /Applications/WageRoute.app
```

(The old `brew install --cask --no-quarantine` flag no longer works for this.) Downloading the DMG with `curl` instead of a browser or package manager also avoids the prompt, because curl does not set the quarantine attribute. Full background is in [docs/RELEASING.md](https://github.com/ReVax-2007/wageroute/blob/main/docs/RELEASING.md) in the main repository.

## Upgrade

```bash
brew upgrade --cask wageroute
```

If the tap itself seems stale, update it first: `brew update && brew upgrade --cask wageroute`.

## Uninstall

```bash
brew uninstall --cask wageroute
```

This removes only the app. The cask deliberately defines **no `zap` stanza**, so even `brew uninstall --zap wageroute` cannot touch your ledger database at `~/Library/Application Support/WageRoute`.

## Troubleshooting

| Symptom | Fix |
| --- | --- |
| "Refusing to load cask ... from untrusted tap" | `brew trust revax-2007/wageroute` |
| "It seems there is already an App at '/Applications/WageRoute.app'" | Quit WageRoute, then `brew install --cask --force wageroute` |
| Gatekeeper dialog on first launch | Right-click the app → Open; or run `sudo xattr -rd com.apple.quarantine /Applications/WageRoute.app` to remove quarantine |
| `brew upgrade` says the cask is not installed | `brew install --cask wageroute` |

## Maintaining this tap

The cask tracks one WageRoute version at a time. After each WageRoute release is published:

1. Copy the new `version` and both architecture SHA-256 checksums from the release's `SHA256SUMS.txt` into `Casks/wageroute.rb`.
2. Verify: `brew audit --cask --online wageroute`.
3. Smoke-test into a scratch dir (does not touch `/Applications`): `brew install --cask --appdir=/tmp/wr-brew-test wageroute`, then `rm -rf /tmp/wr-brew-test`.

The release checklist in the main repository lists this as a required step: [docs/RELEASING.md](https://github.com/ReVax-2007/wageroute/blob/main/docs/RELEASING.md#release-checklist).

## License

WageRoute is source-available, not open-source. See [LICENSE](LICENSE) in this repository (same license as the main WageRoute repository).
