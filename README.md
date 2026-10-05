# advoura/homebrew-tap
testing
Homebrew cask for [Advoura](https://advoura.com/) — an offline, local-first
desktop reader for your own medical records.

## Install

```
brew tap advoura/tap
brew install --cask advoura
```

Apple Silicon Macs only, macOS 11 (Big Sur) or later.

## What this repository is

This repository holds only the Homebrew cask (`Casks/advoura.rb`), this
README, and this repository's own CI (`cask-guard`, `brew style`,
`brew audit`). It contains no application source code, no secrets, and no
internal infrastructure names. `Casks/advoura.rb` is updated automatically
by Advoura's release pipeline when a new version ships — every such update
is a pull request that must pass the required `cask-guard` check before it
can merge, and no one merges it by hand.

## Licence

Advoura is commercial software. See
[advoura.com/terms](https://advoura.com/terms) for the licence governing
use of the application. This repository's own contents (the cask file and
its CI) are not the application itself.

## Uninstalling

```
brew uninstall --cask advoura
brew uninstall --zap --cask advoura
```

`--zap` removes ordinary application traces (caches, saved window state).
It never touches your encrypted record database, which Advoura stores
under `~/Library/Application Support/com.advoura` — uninstalling or
zapping this cask never removes or exposes your records.
