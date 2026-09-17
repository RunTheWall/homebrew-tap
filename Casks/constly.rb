cask "constly" do
  arch arm: "aarch64", intel: "x86_64"

  version "4.7.1"
  sha256 arm:   "d34bd468fe5cb7af28edc5e84f3eaeca35aba6a1e7b9bddee595be90237a3663",
         intel: "de0888223433ff930a3f680a4911bc6d9515f3d3ad1a50ae71666a9bdf26b310"

  url "https://downloads.constly.com/v#{version}/Constly_#{version}_#{arch}.dmg"
  name "Constly"
  desc "WYSIWYG markdown editor that renders the marks away as you type"
  homepage "https://constly.com/"

  livecheck do
    url "https://downloads.constly.com/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  # Constly ships its own signed, minisign-verified auto-updater; let it drive
  # upgrades so brew never fights the in-app update (per RTW distribution
  # decision, 7 Aug 2026). `brew upgrade` becomes a no-op for this cask.
  auto_updates true
  depends_on macos: :big_sur

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
