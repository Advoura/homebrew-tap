cask "advoura" do
  # version and sha256 are written by the release pipeline from the bytes it
  # uploaded, never typed by hand. Keep both lines bare (no trailing comment):
  # cask-guard matches them as whole lines.
  version "0.3.2"
  sha256 "06cd2e2c5bd10dccc81f66bbcd590f9854fabddf902b1867f087b00a39f9d8c3"

  # Immutable, versioned key. Never "latest". The "aarch64" segment matches
  # the bundler's own naming so one glance at the URL confirms which
  # artifact this is.
  # No `verified:` -- downloads.advoura.com is under the homepage's own
  # domain, so `brew audit` flags `verified:` as unnecessary.
  url "https://downloads.advoura.com/releases/#{version}/Advoura_#{version}_aarch64.dmg"
  name "Advoura"
  desc "Offline reader for your own medical records"
  homepage "https://advoura.com/"

  livecheck do
    url "https://downloads.advoura.com/releases/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  # Apple Silicon only. `aarch64` is hard-coded in the URL above, and this
  # stanza is what actually refuses an Intel Mac.
  depends_on arch: :arm64
  # Floor: macOS 11 Big Sur -- the oldest macOS current Homebrew runs on,
  # and arm64 macOS starts at 11 regardless.
  depends_on :macos

  # The app has no updater and no update check of any kind. Leave
  # `auto_updates` at its default (false) on purpose.

  app "Advoura.app"

  # Zap intentionally never touches the app's own local data directory,
  # where the encrypted record database, its lock file and the provider
  # directory cache live. Only ordinary OS-level app traces below.
  zap trash: [
    "~/Library/Caches/com.advoura",
    "~/Library/HTTPStorages/com.advoura",
    "~/Library/Saved Application State/com.advoura.savedState",
  ]
end
