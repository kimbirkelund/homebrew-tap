# homebrew-tap

Homebrew tap for [`mac-notifications-by-key`](https://github.com/kimbirkelund/mac-notifications-by-key)
(`nbk`) — keyboard-driven control of macOS notifications via the Accessibility API.

## Install

```sh
brew install kimbirkelund/tap/nbk        # stable — tracks final releases
brew install kimbirkelund/tap/nbk-beta   # prerelease — tracks release candidates
```

`nbk` and `nbk-beta` conflict (both install a `nbk` binary), so only one is installed at a time.
Switch channels with:

```sh
brew uninstall nbk && brew install kimbirkelund/tap/nbk-beta   # stable -> beta
brew uninstall nbk-beta && brew install kimbirkelund/tap/nbk   # beta -> stable
```

The binary is unsigned; Homebrew strips the download quarantine on install. After install, grant
Accessibility permission to whatever runs `nbk`:

    System Settings → Privacy & Security → Accessibility

Check status with `nbk doctor`.

## Maintenance

**Do not edit `Formula/*.rb` by hand.** They are generated. The source of truth lives in the main
repo at [`packaging/homebrew/`](https://github.com/kimbirkelund/mac-notifications-by-key/tree/main/packaging/homebrew);
the Release workflow rewrites `version`/`sha256` and pushes the updated formula here on every release
(final releases bump `nbk`, `rc/*` prereleases bump `nbk-beta`).
