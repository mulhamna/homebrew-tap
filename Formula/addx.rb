class Addx < Formula
  desc "Universal AI tooling manager with a mouse-clickable TUI"
  homepage "https://github.com/mulhamna/addx"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/addx/releases/download/v0.2.0/addx-darwin-arm64"
      sha256 "84648fc71a2e5dfccbbff72042a443087c752ebb4eeac401419d57bd5f701e7d"
    end
    on_intel do
      url "https://github.com/mulhamna/addx/releases/download/v0.2.0/addx-darwin-x64"
      sha256 "525689756bd1b5c0d1bb16821e9d4e1db31322f711a04cad75db39115e66e45d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/addx/releases/download/v0.2.0/addx-linux-arm64"
      sha256 "3457d5285a5d7b9c6b39e4de7284c45092dca7aff4b4b31785983dc8a1c12a33"
    end
    on_intel do
      url "https://github.com/mulhamna/addx/releases/download/v0.2.0/addx-linux-x64"
      sha256 "84b6e547efbf39114089c5ca6322985b485c428c93b4681d07002aa3c3436263"
    end
  end

  def install
    bin.install Dir["addx-*"].first => "addx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/addx --version")
  end
end
