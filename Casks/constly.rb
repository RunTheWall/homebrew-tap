cask "constly" do
  arch arm: "aarch64", intel: "x86_64"

  version "4.9.0"
  sha256 arm:   "3c2f9f6a3e3f5228d5c6bcdf379d0ae9c08685fc1f2d79d58617430ea71cced0",
         intel: "9c547ea00f29ca7e02f61c90bb06149aa64cbea2efcdbdbc52deea14ae658ce2"

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
