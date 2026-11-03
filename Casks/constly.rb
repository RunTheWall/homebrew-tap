cask "constly" do
  arch arm: "aarch64", intel: "x86_64"

  version "4.13.0"
  sha256 arm:   "ad477303deb578a687e50e52a60c7597134234bd52bd7f88228612db962197c5",
         intel: "e6f34486446189c9e86eb9c75b64d7db694c3291e413a6f46f899ae208a9fb1f"

  url "https://github.com/RunTheWall/constly-app/releases/download/v#{version}/Constly_#{version}_#{arch}.dmg"
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
