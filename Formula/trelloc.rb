class Trelloc < Formula
  desc "Unofficial Trello CLI and MCP server"
  homepage "https://github.com/mulhamna/trello-commands"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/trello-commands/releases/download/v1.2.0/trelloc-macos-aarch64.tar.gz"
      sha256 "ca753295c1e646c1207afd00e6454700e8f4f0c1c2a3ea458f1b118f67a058b2"
    end
    on_intel do
      url "https://github.com/mulhamna/trello-commands/releases/download/v1.2.0/trelloc-macos-x86_64.tar.gz"
      sha256 "a253c13a77cf91426a3df232562de79879d0a8397dd77baf00afd11886f1c1e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/trello-commands/releases/download/v1.2.0/trelloc-linux-aarch64.tar.gz"
      sha256 "6f2e209a756c1aeb235481a6ba4a20cd52de068b997a8f8797120a6c52c04706"
    end
    on_intel do
      url "https://github.com/mulhamna/trello-commands/releases/download/v1.2.0/trelloc-linux-x86_64.tar.gz"
      sha256 "245ee5f97fd837357d886c7fa632b36af72ef4064c2cd7cfc7878443b6423f32"
    end
  end

  def install
    bin.install Dir["trelloc-*"].first => "trelloc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trelloc --version")
  end
end
