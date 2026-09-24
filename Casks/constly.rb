cask "constly" do
  arch arm: "aarch64", intel: "x86_64"

  version "4.8.1"
  sha256 arm:   "1a4c8b9608238309e0fef72e62f98a249f30206c0afa3605ffefa4affbb40ce7",
         intel: "c23a6a5072050cb5b03e2a8a2f145d3653c90cfc1a7201fe9acabdc2a1033bca"

  url "https://downloads.constly.com/v#{version}/Constly_#{version}_#{arch}.dmg"
  name "Constly"
  desc "WYSIWYG markdown editor that renders the marks away as you type"
  homepage "https://constly.com/"

  livecheck do
    url "https://downloads.constly.com/latest.json"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :json do |json, regex|
      json["version"].to_s[regex, 1]
    end
  end

  # Constly ships its own signed, minisign-verified auto-updater; let it drive
  # upgrades so brew never fights the in-app update (per RTW distribution
  # decision, 7 Aug 2026). `brew upgrade` becomes a no-op for this cask.
  auto_updates true
  depends_on :macos

  app "Constly.app"

  zap trash: [
    "~/Library/Application Support/com.constly.app",
    "~/Library/Caches/com.constly.app",
    "~/Library/HTTPStorages/com.constly.app",
    "~/Library/Preferences/com.constly.app.plist",
    "~/Library/Saved Application State/com.constly.app.savedState",
    "~/Library/WebKit/com.constly.app",
  ]
end
