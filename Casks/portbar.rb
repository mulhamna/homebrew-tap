cask "portbar" do
  version "1.2"
  sha256 "23c120d03feec2e70a539cdda657545b3fd2844f8f62510575a3a75945e089ed"

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
