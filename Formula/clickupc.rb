class Clickupc < Formula
  desc "Unofficial ClickUp CLI and MCP server"
  homepage "https://github.com/mulhamna/clickup-commands"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.3.0/clickupc-macos-aarch64.tar.gz"
      sha256 "be40ad718cc44a93d2cfe2c23da342b166e616b7c327815719dd6ef6ebe29f9a"
    end
    on_intel do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.3.0/clickupc-macos-x86_64.tar.gz"
      sha256 "27c2e754334de43cd0f838fd5d3be57af4a3e736b9a062427fb87dcf1a2d59e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.3.0/clickupc-linux-aarch64.tar.gz"
      sha256 "ef2c5b4c207a02b553d6842c7a21e177eac37997dafb811a1e61deefa2890995"
    end
    on_intel do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.3.0/clickupc-linux-x86_64.tar.gz"
      sha256 "f234fca9e0349b44ba53ec60af64e4f16d71e0bc2aee45f81bc96e48da2c3b37"
    end
  end

  def install
    bin.install Dir["clickupc-*"].first => "clickupc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clickupc --version")
  end
end
