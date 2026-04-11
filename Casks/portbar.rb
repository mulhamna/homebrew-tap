cask "portbar" do
  version "1.1"
  sha256 "daf072535ae7345a501c31fe7786552ea4495a5979f1abb3a68e9c35259f0094"

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
