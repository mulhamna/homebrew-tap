class Trelloc < Formula
  desc "Unofficial Trello CLI and MCP server"
  homepage "https://github.com/mulhamna/trello-commands"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/trello-commands/releases/download/v1.1.0/trelloc-macos-aarch64.tar.gz"
      sha256 "bc6372ef943b84605caa4395494291d1c5cc7496f8a00364b7ad7231380f0553"
    end
    on_intel do
      url "https://github.com/mulhamna/trello-commands/releases/download/v1.1.0/trelloc-macos-x86_64.tar.gz"
      sha256 "d556d3511ee95d9a03eeb9cd537ca2314ea6b8f40851add93b6ae59d692e09f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/trello-commands/releases/download/v1.1.0/trelloc-linux-aarch64.tar.gz"
      sha256 "aef94779c3855fddaf7705f489e5fa7b75ceec6991128fe10084ad96ca017554"
    end
    on_intel do
      url "https://github.com/mulhamna/trello-commands/releases/download/v1.1.0/trelloc-linux-x86_64.tar.gz"
      sha256 "77f974a11292a1fc02b786904bd2636fed7925d6853ad447a37f06272b88dc1c"
    end
  end

  def install
    bin.install Dir["trelloc-*"].first => "trelloc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trelloc --version")
  end
end
