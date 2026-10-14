class Clickupc < Formula
  desc "Unofficial ClickUp CLI and MCP server"
  homepage "https://github.com/mulhamna/clickup-commands"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.2.0/clickupc-macos-aarch64.tar.gz"
      sha256 "09ade0c2d3f3c9b798277d7def6f0db6817cf06754e8ef07719ffc2a9135ec54"
    end
    on_intel do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.2.0/clickupc-macos-x86_64.tar.gz"
      sha256 "974dcfe2b17ed76f68a93d36dacb816948cc0575a6d599a46b4b8d56f2ff258f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.2.0/clickupc-linux-aarch64.tar.gz"
      sha256 "f93f8dfd48b3527e00d3a6addf1a27fa6b9b25e835364af0fa74076f41c97a57"
    end
    on_intel do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.2.0/clickupc-linux-x86_64.tar.gz"
      sha256 "8fbf07c25dff822e9b75de22a24dfddd30b2ca262ea59cbedcd77f6b2fd283af"
    end
  end

  def install
    bin.install Dir["clickupc-*"].first => "clickupc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clickupc --version")
  end
end
