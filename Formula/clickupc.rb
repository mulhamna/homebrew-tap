class Clickupc < Formula
  desc "Unofficial ClickUp CLI and MCP server"
  homepage "https://github.com/mulhamna/clickup-commands"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.1.0/clickupc-macos-aarch64.tar.gz"
      sha256 "9b78ddee95514779911b154148fb74924ea466f777bfe99860748b7af1baec80"
    end
    on_intel do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.1.0/clickupc-macos-x86_64.tar.gz"
      sha256 "fc7fb1dd5ea7455304de20f22440168d783860b44062e9ee533f69e7ca3fad8f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.1.0/clickupc-linux-aarch64.tar.gz"
      sha256 "5403c7597315e1962efcdad05c8141312346a08210861e42baed4b432ec9525c"
    end
    on_intel do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.1.0/clickupc-linux-x86_64.tar.gz"
      sha256 "2099d21d71aaa6091857fab3f6697e7dd37bf0a9bc8338a2c28b7a2b2a4b70a8"
    end
  end

  def install
    bin.install Dir["clickupc-*"].first => "clickupc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clickupc --version")
  end
end
