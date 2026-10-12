class Clickupc < Formula
  desc "Unofficial ClickUp CLI and MCP server"
  homepage "https://github.com/mulhamna/clickup-commands"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.0.2/clickupc-macos-aarch64.tar.gz"
      sha256 "e96b1c404c935394770e23de2b6d8b5231a93ea68ae4faa48bc37f48700e3d07"
    end
    on_intel do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.0.2/clickupc-macos-x86_64.tar.gz"
      sha256 "974eb7967baa768ffe765314258ad5e345412c96dfd66973304d5e86828753ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.0.2/clickupc-linux-aarch64.tar.gz"
      sha256 "a631875eaeee28679d19123a2302995e032077d2e624d02d04510f80bb157aba"
    end
    on_intel do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.0.2/clickupc-linux-x86_64.tar.gz"
      sha256 "50b313a0e764b96ec85102be05f9501bcd8a7cdd2afcb583d15165e28c35058b"
    end
  end

  def install
    bin.install Dir["clickupc-*"].first => "clickupc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clickupc --version")
  end
end
