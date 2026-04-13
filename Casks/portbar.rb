cask "portbar" do
  version "2.0"
  sha256 "73a4d890c58163c2f797d8c48983df35075e225e90f05b06084401431bf398a9"

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
