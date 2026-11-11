class Clickupc < Formula
  desc "Unofficial ClickUp CLI and MCP server"
  homepage "https://github.com/mulhamna/clickup-commands"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.5.0/clickupc-macos-aarch64.tar.gz"
      sha256 "0a899e24a633d1b26446fc78db8d780a0a86e717498edcaaee4b0463042ab00b"
    end
    on_intel do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.5.0/clickupc-macos-x86_64.tar.gz"
      sha256 "86ed2c84a5897f10d7d5be33d65febc2fcb1b9aa8cd96ba800cb9bad4929be4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.5.0/clickupc-linux-aarch64.tar.gz"
      sha256 "0156554f943c22073aaad64df9fafc3887338282a22683a484d68192cc93db11"
    end
    on_intel do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.5.0/clickupc-linux-x86_64.tar.gz"
      sha256 "a0841075d9577a57770a20ab446674976339386e538beec6afab8234deed30d2"
    end
  end

  def install
    bin.install Dir["clickupc-*"].first => "clickupc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clickupc --version")
  end
end
