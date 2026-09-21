cask "constly" do
  arch arm: "aarch64", intel: "x86_64"

  version "4.8.0"
  sha256 arm:   "08445cee968bb55b4726227f5bda43f0ff66d64f7fa1a00a0d92f9a8ca200aac",
         intel: "7cb9ce368bfa2fb3590e4ec3747100f45b3b0a07d8573e61b3f9111218e64c1f"

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
