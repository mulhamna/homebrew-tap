cask "portbar" do
  version "2.1"
  sha256 "19f8ec384118cf9236b346b25e41f0f71781d8bfc369a99611be3fd063c7a4aa"

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
