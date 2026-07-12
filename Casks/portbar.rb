cask "portbar" do
  version "3.1.2"
  sha256 "27ca3c156cf00cae5776a6b52f46eb632740bf50f36c4867cec55e709b4e7834"

  url "https://github.com/mulhamna/portbar/releases/download/v#{version}/PortBar-#{version}.dmg"
  name "PortBar"
  desc "macOS menu bar app that shows all active listening ports"
  homepage "https://github.com/mulhamna/portbar"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "PortBar.app"

  zap trash: [
    "~/Library/Preferences/com.portbar.PortBar.plist",
    "~/Library/Application Support/PortBar",
  ]
end
